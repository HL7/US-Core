/// Wrap everything in a function to prevent globally exposing temporary state
(function() {
    /// Capture the old and new datastores
    let newDatastore = %@;
    let oldDatastore = %@;
    let session = %@;
    
    /// Enumerate the old values and remove them from the datastore
    for (let [key, value] of Object.entries(oldDatastore)) {
        delete applenews.datastore[key];
    }

    /// Enumerate the new values and add them to the datastore without triggering messages
    for (let [key, value] of Object.entries(newDatastore)) {
        applenews.datastore[key] = value;
    }

    /// Send out change event
    let event = new CustomEvent('ANDatastoreChanged', {
        detail: {
            newDatastore: newDatastore,
            oldDatastore: oldDatastore,
            session: session
        }
    });
    document.dispatchEvent(event);
})()
