//
//  JSModels.js
//  AppleMediaServicesUI
//
//  Created by Daniel Jackson on 09/30/19.
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

// Base class
class AMSModel {
    constructor() {
        this.modelClass = this.constructor.name;
    }
}

class AMSPageModel extends AMSModel {
    constructor() {
        super();
        
        // Setting this property will change the global background color.
        // Accepted values:
        //   Any hex string
        //   -apple-system-background
        //   -apple-system-secondary-background
        //   -apple-system-tertiary-background
        //   -apple-system-grouped-background
        //   -apple-system-secondary-grouped-background
        //   -apple-system-tertiary-grouped-background
        this.backgroundColor = null;
        
        // The AMSMetricEvent for the page impression
        this.impressionEvent = null;
        
        // An AMSNavigationBarModel object
        this.navigationBar = null;
        
        // Update the window size on macOS
        // Type: Array; Example: [<width>, <height>]
        this.windowSize = null;
    }
}

// MARK: -

class AMSButtonModel extends AMSModel {
    constructor(title) {
        super();
        
        // An AMSAction object
        this.action = null;
        
        // An AMSActivityIndicatorModel
        this.activityIndicator = null;
        
        // True to bold the text of the button.
        this.bold = false;
        
        // The title of the button
        this.title = title;
        
        // False to disable the button
        this.enabled = true;
        
        // See AMSButtonModel.STYLE
        this.style = 0;
    }
}

AMSButtonModel.STYLE = {
    DEFAULT: 0,
    DESTRUCTIVE: 1,
    CANCEL: 2,
    DISMISS: 3,
};

class AMSActivityIndicatorModel extends AMSModel {
    constructor() {
        super();
        
        this.animate = true;
    }
}

// A page model representing a OCR camera reader.
// Callers should register for the "CameraReaderInfo" service to receive updates on code recognition.
// This callback should return a promise for an action.
class AMSCameraReaderPageModel extends AMSPageModel {
    constructor() {
        super();
        
        // The type of camera reader. @see AMSCameraReaderPageModel.PAGE_TYPES
        this.pageType = 0;
        
        this.primaryLabel = null;
        
        this.secondaryLabel = null;
        
        this.bottomLinkLabel = null;
        
        this.bottomLinkAction = null;
    }
}

AMSCameraReaderPageModel.PAGE_TYPES = {
    CREDIT_CARD_READER: 0,
    GIFT_CARD_READER: 1,
};

class AMSConditionalButtonModel extends AMSModel {
    constructor() {
        super();
        
        this.button = null;
        
        this.hideOnModal = false;
        
        this.hideOnPush = false;
    }
}

class AMSDialogButtonModel extends AMSButtonModel {
    constructor(title, callback) {
        super(title);
        
        // Javascript function.
        // IMPORTANT: This only works when running with AMS.dialog(...)
        this.callback = callback;
        
        this.identifier = null;
    }
}

class AMSDynamicPageModel extends AMSPageModel {
    constructor(url) {
        super();
        
        // An account object
        this.account = null;
        
        this.clientOptions = null;
        
        this.metricsOverlay = null;
        
        this.url = url;
    }
}

class AMSErrorPageModel extends AMSPageModel {
    constructor() {
        super();
        
        // An AMSAction object
        this.action = null;
        
        this.actionButtonTitle = null;
        
        this.errorMessage = null;
        
        this.errorMessageInternalOnly = false;
        
        this.errorTitle = null;
        
    }
}

class AMSLoadingPageModel extends AMSPageModel {
    constructor() {
        super();
        
        this.disableDelay = false;
        
        this.message = null;
        
    }
}

class AMSNavigationBarModel extends AMSModel {
    constructor() {
        super();
        
        this.backButtonTitle = null;
        
        this.hideBackButton = false;
        
        // AMSButtonModel or an array of AMSConditionalButtonModel (first one to match wins)
        this.leftButton = null;
        
        // AMSButtonModel or an array of AMSConditionalButtonModel (first one to match wins)
        this.rightButton = null;
        
        // The navigation bar style. Can only be set during for the
        // initial page load or when using with an AMSFlowAction.
        // @see AMSNavigationBarModel.STYLES
        this.style = 0;
        
        this.title = "";
    }
}

AMSNavigationBarModel.STYLES = {
    INHERIT: 0,
    HIDDEN: 1,
    DEFAULT: 2,
    LARGE: 3,
    SEMI_TRANSPARENT: 4,
    TRANSPARENT: 5,
    SEMI_TRANSPARENT_SOLID: 6,
    ROUNDED_BUTTONS: 7,
}

class AMSWebPageModel extends AMSPageModel {
    constructor() {
        super();
    }
}
