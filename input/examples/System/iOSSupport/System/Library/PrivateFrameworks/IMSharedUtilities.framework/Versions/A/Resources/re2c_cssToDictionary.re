/*
    $Id: entities.re 886 2006-09-21 22:13:19Z iccir $
    PubSub

    Created by Ricci Adams on 6/13/06.
    Copyright 2008, Apple Inc.  All rights reserved.
*/


/*!ignore:re2c
    This file is used with re2c (http://www.re2c.org/) to generate
    re2c_cssToDictionary.m.  UPON MODIFYING THIS FILE, EXECUTE THE FOLLOWING:

    re2c --bit-vectors --no-debug-info re2c_cssToDictionary.re > re2c_cssToDictionary.m
*/

NSDictionary *IMCreateDictionaryFromCSSString(NSString *inCSS, BOOL lowercaseKeys);

NSDictionary *IMCreateDictionaryFromCSSString(NSString *inCSS, BOOL lowercaseKeys)
{
    #define ENCODING NSUTF8StringEncoding

    if (!inCSS) return nil;

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSString *currentString = nil;
    NSString *currentKey    = nil;

    NSUInteger len = [inCSS lengthOfBytesUsingEncoding:ENCODING];
    if ((len == 0) || (len++ == 0)) return nil;
    char *buffer = malloc(len);
    if (!buffer) return nil;

    if (![inCSS getCString:buffer maxLength:len encoding:ENCODING]) {
        [dict release];
        free(buffer);
        return nil;
    }

    const char *i = buffer;    // Input pointer
    const char *start;         // Start of current string
    const char *marker = NULL;

    marker = marker; // Avoid a warning.

    #define YYCTYPE   unsigned char
    #define YYCURSOR  i
    #define YYLIMIT   i
    #define YYMARKER  marker
    #define YYFILL(n)

    #define PREVENT_UNUSED_WARNING (void)yych;
    #define BREAK    PREVENT_UNUSED_WARNING break;
    #define CONTINUE PREVENT_UNUSED_WARNING continue;

    for ( ; ; ) {
        start = i;

/*!re2c
        ws         = [ \t\r\n];
        keyOrValue = [^:;\000];
        endKey     = ':';
        endValue   = [;\000];

        keyOrValue+ {
            const char *trimmedStart;
            for (trimmedStart = start; trimmedStart < i; trimmedStart++) {
                const char c = *trimmedStart;
                if ( c != ' ' && c != '\t' && c != '\n' && c != '\r' && c != '\'' && c != '"' ) break;
            }
            
            const char *trimmedEnd;
            for (trimmedEnd = i; trimmedEnd > (trimmedStart + 1); trimmedEnd--) {
                const char c = trimmedEnd[-1];
                if ( c != ' ' && c != '\t' && c != '\n' && c != '\r' && c != '\'' && c != '"' ) break;
            }
            
            [currentString release];
            currentString = [[NSString alloc] initWithBytes:(void *)trimmedStart length:(trimmedEnd - trimmedStart) encoding:ENCODING];
            
            #ifdef RE2C_DEBUG
                _IMLog(@"currentString is now %@", currentString);
            #endif
            
            CONTINUE;
        }
        
        endKey {
            [currentKey release];
            currentKey = currentString;
            currentString = nil;

            #ifdef RE2C_DEBUG
                _IMLog(@"currentString is now %@.  currentKey is now %@", currentString, currentKey);
            #endif
            
            CONTINUE;
        }

        endValue {
            if (currentKey && currentString) {
                [dict setObject:currentString forKey:(lowercaseKeys ? currentKey.lowercaseString : currentKey)];
            }

            #ifdef RE2C_DEBUG
                _IMLog(@"dict[%@] = %@", currentKey, currentString);
            #endif

            [currentKey release];
            [currentString release];
            currentString = currentKey = nil;
            
            if (*start) {
                CONTINUE;
            } else {
                BREAK;
            }
        }

        . | ws { CONTINUE; }
*/
    }
    
    [currentKey    release];
    [currentString release];
    
    free(buffer);
    
    return dict;
}

