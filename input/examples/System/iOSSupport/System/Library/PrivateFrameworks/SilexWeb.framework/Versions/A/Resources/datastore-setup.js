/// Wrap everything in an anonymous function to capture internal scope
(function() {

    /// Create the datastore 
    const datastore = {};

    /// Add the 'add' function to the object
    Object.defineProperty(datastore, 'add', {
        writable: false,
        value: function(objects) {
            for (let [key, value] of Object.entries(objects)) {
                this[key] = value;
            }

            /// Post a message to webkit to indicate the datastore has add values
            window.webkit.messageHandlers.applenews.postMessage({
                "name": "datastore",
                "datastore": JSON.stringify(this)
            });
        }
    });

    /// Add the 'remove' function to the object
    Object.defineProperty(datastore, 'remove', {
        writable: false,
        value: function(keys) {
            if (Array.isArray(keys)) {
                for (let key of keys) {
                    delete this[key];
                }
            } else {
                delete this[keys];
            }

            /// Post a message to webkit to indicate the datastore has removed values
            window.webkit.messageHandlers.applenews.postMessage({
                "name": "datastore",
                "datastore": JSON.stringify(this)
            });
        }
    });

    /// Define the datastore property on the applenews object
    Object.defineProperty(applenews, 'datastore', {
        writable: false,
        value: datastore
    });

    /// Enumerate the key-value pairs in the injected datastore
    for (let [key, value] of Object.entries( %@)) {
        applenews.datastore[key] = value;
    }
})();
