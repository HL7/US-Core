
let AMSSafari = {
    
    callbackScheme: null,
    
    callService: function(data) {
        return window.webkit.messageHandlers.callback.postMessage({ action: "callback", data: data });
    },
    
    data: {},
    
    dismiss: function() {
        return window.webkit.messageHandlers.callback.postMessage({ action: "dismiss" });
    },
    
    finishedLoading: function(success) {
        return window.webkit.messageHandlers.callback.postMessage({ action: "finishedLoading", data: { success: success } });
    },
    
    pop: function() {
        return window.webkit.messageHandlers.callback.postMessage({ action: "pop" });
    },
    
    // Set this function (no arguments) to retry the loading.
    // NOTE: This may get called during a timeout. So you should coalesce your requests.
    retryCallback: null,
    
}
