//
//  JSProperties.js
//  AppleMediaServicesUI
//
//  Created by Daniel Jackson on 09/30/19.
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

function decodeBase64(str) {
    percentEncodedStr = atob(str).split('').map(function(c) {
        return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join('');
    return decodeURIComponent(percentEncodedStr);
}

AMS.registerService("_PostEvent", function(object) {
    var event = new CustomEvent(object.name, { detail: object.options });
    AMS.dispatchEvent(event);
});
