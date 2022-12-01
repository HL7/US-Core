var keywords = [
    // Normal keywords.
    "await", "break", "case", "catch", "const", "continue", "debugger",
    "default", "delete", "do", "else", "finally", "for", "function", "if",
    "in", "instanceof", "new", "return", "switch", "this", "throw", "try",
    "typeof", "var", "void", "while", "with",

    // Future reserved words.
    "class", "enum", "export", "extends", "import", "super",

    // Future reserved in strict mode.
    "implements", "interface", "let", "package", "private", "protected",
    "public", "static", "yield",
];

var values = [
    "null",
    "true",
    "false",
];

var punctuators = [
    "{", "}", "(", ")", "[", "]",
    ",", ".",
    "+", "-", "/", "*", "%", "**",
    "++", "--",
    "=", "+=", "-=", "*=", "/=", "%=", "**=",
    "<", ">", "<=", ">=", "<<=", ">>=", ">>>", "<<<=",
    "==", "===", "!=", "!==",
    "!", "&&", "||",
    "<<", ">>", "|", "&", "&=", "~", "^", "^=", "|=",
    "\"", "'",
    "?",
    ";", ":",
];

var makeToken = function(start, length, type) {
    var token = PluginAPI.Token.constructToken();
    token.start = start;
    token.length = length;
    token.type = type;
    token.overflows = false;
    return token;
};

var isWhitespace = (function() {
    var regex = new RegExp("\\s");
    return function(s) {
        return regex.test(s);
    };
})();

var isKeyword = function(s) {
    return keywords.indexOf(s) !== -1;
};

var isValueLiteral = function(s) {
    return values.indexOf(s) !== -1;
};

var isIdentifier = (function() {
    var regex = new RegExp("^[a-zA-Z_][a-zA-Z0-9_]*$");
    return function(s) {
        return regex.test(s);
    };
})();

var scanNumberLiteral = (function() {
    var scanWithRegex = function(regex) {
        return function(s, start) {
            var result = s.substring(start).match(regex);
            if (!result)
                return;

            // If the immediately next character is an alphabetic character, then invalidate this token.
            if (s[start + result[0].length] && isIdentifier(String(s[start + result[0].length])))
                return;

            return makeToken(start, result[0].length, "number");
        };
    };

    var scanHexLiteral = scanWithRegex(new RegExp("^0[xX][0-9a-fA-F]+"));
    var scanDecimalWithPoint = scanWithRegex(new RegExp("^(0|[1-9][0-9]*)\\.([0-9]+)?([eE][+-]?[0-9]+)?"));
    var scanFractionWithPoint = scanWithRegex(new RegExp("^\\.[0-9]+([eE][+-]?[0-9]+)?"));
    var scanDecimalWithExponent = scanWithRegex(new RegExp("^(0|[1-9][0-9]*)([eE][+-]?[0-9]+)?"));

    var scanDecimalLiteral = function(s, start) {
        return scanDecimalWithPoint(s, start)
            || scanFractionWithPoint(s, start)
            || scanDecimalWithExponent(s, start);
    };

    return function(s, start) {
        return scanHexLiteral(s, start) || scanDecimalLiteral(s, start);
    };
})();

var finishScanString = function(s, start, endChar) {
    var escaped = false;
    var i = start;
    while (i < s.length) {
        if (s[i] === "\\") {
            escaped = !escaped;
        } else if (s[i] === endChar && !escaped) {
            break;
        } else if (escaped) {
            escaped = false;
        }
        i++;
    }

    var token = makeToken(start, i - start, "string");
    token.startChar = endChar;
    if (s[i] === endChar && !escaped)
        token.length += 1;
    else if (i === s.length)
        token.overflows = true;
    return token;
};

var scanStringLiteral = function(s, start) {
    if (s[start] !== "\"" && s[start] !== "'")
        return;

    var token = finishScanString(s, start + 1, s[start]);
    token.start = start;
    token.length += 1;
    return token;
};

var scanArray = function(s, start, array, type) {
    for (var i = 0; i < array.length; i++) {
        var item = array[i];
        if (s.substring(start, start + item.length) === item)
            return makeToken(start, item.length, type);
    }
    return;
};

var scanValueLiteral = function(s, start) {
    return scanArray(s, start, values, "value");
};

var scanKeyword = function(s, start) {
    return scanArray(s, start, keywords, "keyword");
};

var scanPunctuator = function(s, start) {
    return scanArray(s, start, punctuators, "punctuator");
};

var scanIdentifier = function(s, start) {
    if (s.length === 0)
        return;

    var lastTryWasIdentifier = false;
    var i = start;
    var currentTokenText = "";
    while (i < s.length) {
        var newTokenText = currentTokenText + s[i];
        if (!isIdentifier(newTokenText)) {
            if (lastTryWasIdentifier)
                break;
            return;
        }
        lastTryWasIdentifier = true;
        currentTokenText = newTokenText;
        i++;
    }

    // We could exit the loop because we hit the end of the file OR...
    // Because the last substring we tried is not a valid identifier.

    if (isKeyword(currentTokenText) || isValueLiteral(currentTokenText))
        return;

    return makeToken(start, i - start, "identifier");
};

var scanUnknown = function(s, start) {
    // We don't know what token we're scanning (it could also be a malformed token)
    // so just scan until we hit whitespace.
    var i = start;
    while (i < s.length && !isWhitespace(String(s[i])))
        i++;

    return makeToken(start, i - start, "unknown");
};

var finishScanBlockComment = (function() {
    var blockCommentRegex = new RegExp("\\*/");
    return function(s, start) {
        if (s.length < start + 2) {
            var token = makeToken(start, s.length - start, "comment");
            token.overflows = true;
            return token;
        }

        var fullString = s.substring(start);
        var result = fullString.search(blockCommentRegex);

        var token = makeToken(start, 0, "comment");
        if (result === -1) {
            token.length = s.length - start;
            token.overflows = true;
        } else
            token.length = result + 2;
        return token;
    };
})();

var scanComment = (function() {
    var scanSingleLineComment = function(s, start) {
        var i = start;
        while (i < s.length && String(s[i]) !== "\n")
            i++;

        return makeToken(start, i - start, "comment");
    };

    return function(s, start) {
        if (s.length < 2)
            return;

        var prefix = s.substring(start, start + 2);
        if (prefix === "//")
            return scanSingleLineComment(s, start);
        if (prefix === "/*") {
            var token = finishScanBlockComment(s, start + 2);
            token.start = start;
            token.length += 2;
            return token;
        }
        return;
    };
})();

// @name nextToken
// @argument s The string which is being tokenized.
// @argument start The current position in the string.
// @previousToken The previous Token object. If this is the first token on the current line
//  the previous Token is the last Token on the previous line. If this is the first line
//  previousToken is null.
// @return A Token API object that represents the next token in s starting from start.
//  What constitutes a Token is up to the language/plugin itself.
syntax.nextToken = function(s, start, previousToken) {
    // We need to start where we left off.
    if (previousToken && previousToken.overflows && start === 0) {
        if (previousToken.type === "comment")
            return finishScanBlockComment(s, start);
        else if (previousToken.type === "string")
            return finishScanString(s, start, previousToken.startChar);
        return;
    }

    // Consume all initial whitespace and punctuators.
    var i = start;
    while (i < s.length && isWhitespace(String(s[i])))
        i++;

    // If we hit the end of the string return nil.
    if (i === s.length)
        return;

    // Reset start to be the first i that isn't whitespace.
    start = i;

    return scanComment(s, start)
        || scanNumberLiteral(s, start)
        || scanStringLiteral(s, start)
        || scanIdentifier(s, start)
        || scanValueLiteral(s, start)
        || scanKeyword(s, start)
        || scanPunctuator(s, start)
        || scanUnknown(s, start);
};
