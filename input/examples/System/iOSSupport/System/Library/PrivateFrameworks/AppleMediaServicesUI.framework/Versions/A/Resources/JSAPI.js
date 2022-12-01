//
//  JSAPI.js
//  AppleMediaServicesUI
//
//  Created by Daniel Jackson on 09/30/19.
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

// ----- Properties -----

// NOTE: Properties will be added at runtime

// ------
// Helper Methods
// ------

// A dialog presentation helper function
AMS.runDialog = function(action) {
    if (!(action instanceof AMSDialogAction)) {
        return;
    }
    
    var promise = AMS.run(action)
    promise.then(function(result) {
        // Locate original button
        var selectedButton = null;
        for (var i = 0; i < action.buttons.length; i++) {
            var button = action.buttons[i];
            if (button.identifier == result.identifier || button.title == action.title) {
                selectedButton = button;
                break;
            }
        }
                 
        if (typeof selectedButton.callback !== "undefined") {
            selectedButton.callback(result);
        }
    });
    return promise;
}
AMS.dialog = AMS.runDialog; // Old naming

// Helper function for loading plugins
AMS.loadPlugin = function(action) {
    if (!(action instanceof AMSLoadPluginAction)) {
        return;
    }
    return AMS.run(action);
}

AMS.SERVICES = {
    PAGE_DATA: "PageData"
};

// ------
// Events
// ------

AMS.EVENT_TYPES = {
    ACCOUNT_CHANGE: "AccountChange",
    APP_QUEUE_CHANGE: "AppQueryResultsChange",
    BUY_CONFIRMED: "BuyConfirmed",
    SUBSCRIPTION_CHANGED: "SubscriptionChanged",
    SAFARI_DATA_UPDATE: "SafariDataUpdate",
    DID_APPEAR: "DidAppear",
    DID_DISAPPEAR: "DidDisappear",
};

let _ams_eventTarget = new EventTarget();
AMS.addEventListener = function(type, listener, useCapture, wantsUntrusted) {
  return _ams_eventTarget.addEventListener(type, listener, useCapture, wantsUntrusted);
}

AMS.dispatchEvent = function(event) {
  return _ams_eventTarget.dispatchEvent(event);
}

AMS.removeEventListener = function(type, listener, useCapture) {
  return _ams_eventTarget.removeEventListener(type, listener, useCapture);
}

// ------
// Service Registration
// ------

// callbacks must return an object. Callbacks must either return nothing or a promise.
let _ams_serviceListeners = {};
AMS.registerService = function(name, callback) {
    if (name == null || callback == null) {
        return;
    }
    _ams_serviceListeners[name] = callback;
}

// Remove service using callback
AMS.unregisterService = function(name, callback) {
    if (callback) {
        if (callback === _ams_serviceListeners[name]) {
            delete _ams_serviceListeners[name];
        }
    }
    else {
        delete _ams_serviceListeners[name];
    }
}
 
/*
 Call registered service listeners.
 
 "PageData" service calls can return an error model to show custom content on failure.
 An example:
     return Promise.reject({
         message: "TEST ERROR",
         code: 123,
         userInfo: {
             errorPageModel: model, // An AMSErrorPageModel
         }
     });
 */
AMS.callService = function(name, JSONString) {
    var object = null;
    if (JSONString != null) {
        object = JSON.parse(JSONString);
    }
    
    var result = null;
    var service = _ams_serviceListeners[name];
    if (typeof service === "function") {
        result = new Promise(function(resolve, reject) {
            var serviceResult = service(object);
            if (serviceResult instanceof Promise) {
                serviceResult.then(function(value) {
                    resolve(value);
                })
                serviceResult.catch(function(error) {
                    reject(error);
                });
            }
            else {
                resolve(serviceResult);
            }
        });
    }

    if (result == null) {
        result = Promise.reject("Service Callback Unset: " + name);
    }

    return result;
}

// Internal use only
AMS.updateProperties = function(object) {
    let decoded = decodeBase64(object);
    let properties = JSON.parse(decoded);
                    
    for (var key in properties) {
        if (typeof AMS[key] !== "function") {
            AMS[key] = properties[key];
        }
    }
    
    AMSLog.debug("AMS properties updated");
    return true;
}
