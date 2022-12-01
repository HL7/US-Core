// Color scheme files provide a number of callbacks to use during syntax highlighting.
// The callbacks refer to colors used for a particular type of token rather than a
// specific color so that multiple colorschemes will work for the same syntax highlighting
// plugin.

// This is a dark-background color scheme.
var comment = colorScheme.makeColor({"red": 47, "green": 255, "blue": 18});  // green
var string = colorScheme.makeColor({"red": 225, "green": 101, "blue": 50}); // red-orange
var number = colorScheme.makeColor({"red": 46, "green": 174, "blue": 187}); // blue
var keyword = colorScheme.makeColor({"red": 216, "green": 154, "blue": 255}); // purple
var value = colorScheme.makeColor({"red":200, "green": 200, "blue": 75}); // yellow
var clear = colorScheme.makeColor({"red": 0, "green": 0, "blue": 0, "alpha": 0});
var white = colorScheme.makeColor({"red": 255, "green": 255, "blue": 255});

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

colorScheme.colorForIdentifier = function() {
    return white;
};

colorScheme.colorForValue = function() {
    return value;
};

colorScheme.defaultForegroundColor = function() {
    return white;
};

colorScheme.defaultBackgroundColor = function() {
    return clear;
};
