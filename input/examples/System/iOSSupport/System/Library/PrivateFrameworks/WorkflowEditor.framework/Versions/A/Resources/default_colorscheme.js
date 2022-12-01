// Color scheme files provide a number of callbacks to use during syntax highlighting.
// The callbacks refer to colors used for a particular type of token rather than a
// specific color so that multiple colorschemes will work for the same syntax highlighting
// plugin.

// This is the default colorscheme. It takes a lot of inspiration from Xcode's color scheme.
var comment = colorScheme.makeColor({"red": 50, "green": 180, "blue": 50});  // green
var string = colorScheme.makeColor({"red": 200, "green": 23, "blue": 55}); // red
var number = colorScheme.makeColor({"red": 28, "green": 0, "blue": 214}); // blue
var keyword = colorScheme.makeColor({"red": 202, "green": 35, "blue": 145}); // purple
var value = colorScheme.makeColor({"red":155, "green": 155, "blue": 40}); // yellow
var black = colorScheme.makeColor({"red": 0, "green": 0, "blue": 0});
var clear = colorScheme.makeColor({"red": 0, "green": 0, "blue": 0, "alpha": 0});

colorScheme.colorForComment = function() {
    return comment;
};

colorScheme.colorForString = function() {
    return string;
};

colorScheme.colorForNumber = function() {
    return number;
};

colorScheme.colorForKeyword = function() {
    return keyword;
};

colorScheme.colorForValue = function() {
    return value;
};

colorScheme.colorForIdentifier = function() {
    return black;
};

colorScheme.defaultForegroundColor = function() {
    return black;
};

colorScheme.defaultBackgroundColor = function() {
    return clear;
};
