const WFRemoteQuarantinePolicyDecision = {
    Allow: 0,
    Deny: 1,
    Prompt: 2,
};

const WFWorkflowRuntimeType = {
    Unknown: 0,
    Safari: 1,
    JavaScriptCore: 2,
};

const WFDefaultErrorTitle = WFLocalizedString("Unsafe JavaScript", "Title of default error for not allowing script to run");
const WFDefaultErrorMessage = WFLocalizedString("This JavaScript is similar to a script that is known to be unsafe. For your security it will not run.", "Message of default error for not allowing script to run");

const WFRemoteQuarantinePolicyCompatilityVersion = 2;
const WFRemoteQuarantinePolicyContentVersion = 1;

var WFQuarantineDecision = {
    policy: null,
    errorTitle: null,
    errorMessage: null,
};

var WFRemoteQuarantineRequestPrototype = {
    appVersion: null,
    osVersion: null,
    userLocale: null,
    runtimeType: null,
    targetURL: null,
    preRuntimeJavaScriptString: null,
    preRuntimeJavaScriptSerializedRepresentation: null,
    runtimeJavaScriptString: null,
    actionList: null,
};


function decidePolicyForQuarantineRequest(quarantineRequest, completionHandler) {
    var decision = Object.assign({}, WFQuarantineDecision);

    const EvalRegEx = /^(.*(\s)+)*eval\(.*\)/im;
    var runtimeJavaScriptString = quarantineRequest.runtimeJavaScriptString || "";
    if (EvalRegEx.test(runtimeJavaScriptString)) {
        decision.policy = WFRemoteQuarantinePolicyDecision.Deny;
        decision.errorTitle = WFLocalizedString("Use of `eval()` not allowed", "Title of error message that the use of the function `eval()` isn't allowed");
        decision.errorMessage = WFLocalizedString("Using `eval()` in JavaScript is unsafe. Instead, please write JavaScript code directly.", "Error message for when JavaScript contains the function `eval()`");
        completionHandler(decision);
        return;
    }

    decision.policy = WFRemoteQuarantinePolicyDecision.Allow;
    completionHandler(decision);
    return;
}

/* This is the function that native code calls in order to decide whether workflow will be allowed to run.
 * This function can be changed using any means in JavaScript to combat malware families, as this
 * while file will be updated over-the-air.
 */
function decidePolicyForWorkflowQuarantineRequest(quarantineRequest, completionHandler) {
    // Create a copy of a `WFQuarantineDecision` object.
    var decision = Object.assign({}, WFQuarantineDecision);
    decision.policy = WFRemoteQuarantinePolicyDecision.Allow;
    completionHandler(decision);
    return;
}
