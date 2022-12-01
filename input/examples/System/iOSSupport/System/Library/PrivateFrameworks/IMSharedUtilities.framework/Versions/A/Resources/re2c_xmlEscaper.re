/*
    $Id: xmlEscaper.re 757 2006-08-27 10:43:56Z iccir $

    Created by Ricci Adams on 8/23/06.
    Copyright 2006, Apple Computer, Inc.  All rights reserved.
*/


/*!ignore:re2c
    This file is used with re2c (http://www.re2c.org/) to generate
    re2c_xmlEscaper.c.  UPON MODIFYING THIS FILE, EXECUTE THE FOLLOWING:

    re2c -1 -i -w re2c_xmlEscaper.re > re2c_xmlEscaper.m
*/

#import <Foundation/Foundation.h>
#include <string.h>

/*!ignore:re2c
    This is a fast string-to-XML escaper.  Usage:
    
    const char *inString = ...;
    int outLength;

    IMEscapedXMLStringFromString(inString, NULL, &outLength);

    char *outString = (char *)malloc(outLength);
    IMEscapedXMLStringFromString(inString, outString, &outLength, NO);

*/
void IMEscapedXMLStringFromString(  const unichar *inString,
                                    unichar       *outString,
                                    size_t        *outStringLength,
                                    NSString      *spaceReplacementString,
                                    NSString      *newlineReplacementString,
                                    NSString      *apostropheReplacementString,
                                    NSString      *quotationReplacementString);


static void sAppend(NSString *stringToAppend, unichar **oPtr, size_t *outStringLength)
{
    NSUInteger length = [stringToAppend length];
    *outStringLength += length;

    if (*oPtr) {
        [stringToAppend getCharacters:*oPtr];
        *oPtr += length;
    }
}


void IMEscapedXMLStringFromString(  const unichar *inString,
                                    unichar       *outString,
                                    size_t        *outStringLength,
                                    NSString      *spaceReplacementString,
                                    NSString      *newlineReplacementString,
                                    NSString      *apostropheReplacementString,
                                    NSString      *quotationReplacementString)
{
    const unichar *i = inString;   // Input  pointer
          unichar *o = outString;  // Output pointer
    const unichar *c;              // Current character

    // Unlike our other converters, the same string buffer cannot be used for
    // both in and out
    //
    if (inString == outString) {
        *outStringLength = 0;
        return;
    }
    
    *outStringLength = 0;


    #define YYCTYPE   unichar
    #define YYCURSOR  i
    #define YYLIMIT   i
    #define YYMARKER  
    #define YYFILL(n)

    #define PREVENT_UNUSED_WARNING (void)i; (void)yych;
    #define BREAK    PREVENT_UNUSED_WARNING break;
    #define CONTINUE PREVENT_UNUSED_WARNING continue;

    #define APPEND(STR) sAppend((STR), &o, outStringLength)
    
    for ( ; ; ) {
        c = i;

/*!re2c
        invalid = [^ \u0000 \u0009 \u000a \u000d \u0020-\ufffd];

        " "{2,} { 
            if (spaceReplacementString) {
                const unichar *looper;
                for (looper = c; looper < i; looper++) {
                    APPEND(spaceReplacementString);
                }
            } else {
                APPEND( @" " );
            }

            CONTINUE;
        }
        
        [\t] { 
            if (spaceReplacementString) {
                APPEND(spaceReplacementString);
                APPEND(spaceReplacementString);
                APPEND(spaceReplacementString);
                APPEND(spaceReplacementString);
            } else {
                APPEND( @" " );
            }
            
            CONTINUE;
        }

        [\r\n\u0085\u2028\u2029] {
            if (newlineReplacementString) {
                APPEND(newlineReplacementString);
            } else {
                APPEND( @" " );
            }

            CONTINUE;
        }
        
        ['] {
            if (apostropheReplacementString) {
                APPEND(apostropheReplacementString);
              } else {
                APPEND( @"'" );
            }

            CONTINUE;
        }
        
        ["] {
            if (quotationReplacementString) {
                APPEND(quotationReplacementString);
            } else {
                APPEND( @"\"" );
            }

            CONTINUE;
        }

        "<"      {  APPEND( @"&lt;"   ); CONTINUE; }
        ">"      {  APPEND( @"&gt;"   ); CONTINUE; }
        "&"      {  APPEND( @"&amp;"  ); CONTINUE; }   
        "\""     {  APPEND( @"&quot;" ); CONTINUE; }

        [\000]   {  BREAK;                                                   }
        invalid  {  CONTINUE;                                                }
        .        {  ++*outStringLength; if (o) { *o = *c; ++o; }  CONTINUE;  }
*/
    }
}
