// @name tokenAttributes
// @argument token The Token object which needs formatting information.
// @return A JavaScript Object with entries where the keys are AttributeNames and
//  the values are the corresponding values for those attributes.
highlighting.tokenAttributes = function(token) {
    var result = {};
    switch (token.type) {
    case "keyword":
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.colorForKeyword();
        break;
    case "value":
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.colorForValue();
        break;
    case "string":
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.colorForString();
        break;
    case "number":
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.colorForNumber();
        break;
    case "comment":
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.colorForComment();
        break;
    case "partial":
    case "unknown":
    case "punctuator":
    default:
        result[PluginAPI.AttributeNames["color"]] = PluginAPI.ColorScheme.defaultForegroundColor();
        break;
    }
    return result;
}