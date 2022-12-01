(function() {
    // This is for older iAd proprietary bundles that may try to access
    // bindings previously exposed on the banner object.
    window.banner = {};
    // We're not supporting these events. Good code would check the existence
    // of these events before adding an event listener. In this case, set
    // the event to null, to indicate that the event is not supported.
    window.DeviceMotionEvent = null;
    window.DeviceOrientationEvent = null;

    var nativeAddEventListener = EventTarget.prototype.addEventListener;

    // Swizzle out addEventListener and throw an error if we don't want to support the event.
    EventTarget.prototype.addEventListener = function (event, callback, options) {
        if (event == "deviceorientation" || event == "devicemotion") {
            throw new Error("The " + event + " event is not supported in this advertisement.");
        } else if (event == "touchmove" || event == "touchend") {
            // Create a new options object
            let newOptions = {}
            if (options === undefined) {
                // The user is not passing useCapture or options. We enforce passive to be true.
                newOptions = { passive: true };
            } else if (typeof options === "boolean") {
                // The user is passing useCapture.
                // We translate it to options in order to enforce passive to be true.
                newOptions = { passive: true, capture: options };
            } else {
                // The user is passing options.
                // If no passive is provided, we enforce it to be true.
                if (!("passive" in options)) {
                    options["passive"] = true
                }
                newOptions = options
            }
            // Call back to the native implementation.
            nativeAddEventListener.call(this, event, callback, newOptions)
        } else {
            // Leave it alone.
            nativeAddEventListener.call(this, event, callback, options)
        }
    }

    window.navigator.geolocation.getCurrentPosition = function (showLocation, errorHandler, options) {
        throw new Error("The geolocation API 'getCurrentPosition()' is not supported in this advertisement.");
    }

    window.navigator.geolocation.watchPosition = function (showLocation, errorHandler, options) {
        throw new Error("The geolocation API 'watchPosition()' is not supported in this advertisement.");
    }

    window.navigator.geolocation.clearWatch = function (watchId) {
        throw new Error("The geolocation API 'clearWatch()' is not supported in this advertisement.");
    }
})();
