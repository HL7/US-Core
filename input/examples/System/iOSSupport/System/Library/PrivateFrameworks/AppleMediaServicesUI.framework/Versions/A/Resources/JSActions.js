//
//  JSActions.js
//  AppleMediaServicesUI
//
//  Created by Daniel Jackson on 09/30/19.
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

// Base class
class AMSAction {
    constructor() {
        this.actionClass = this.constructor.name;

        // The AMSMetricsEvent for the action
        this.actionMetric = null;
    }
}

// MARK: -

class AMSAccountAction extends AMSAction {
    constructor(account) {
        super();
        
        // An updated account object
        this.account = account;
    }
}

//  Following entitlements are required:
//	<key>com.apple.security.exception.mach-lookup.global-name</key>
//	<array>
//		<string>com.apple.appstored.xpc</string>
//	</array>
class AMSAppQueryAction extends AMSAction {
    constructor(bundleIDs, storeItemIDs) {
        super();
        
        // Bundle identifiers
        this.bundleIDs = bundleIDs;

        // true to start observation, false - to stop
        this.enabled = true;

        // Store item identifiers (adamID)
        this.storeItemIDs = storeItemIDs;
    }
}

class AMSAuthenticateAction extends AMSAction {
    constructor(dsid) {
        super();
        
        // An account object (e.g AMS.accounts.current)
        this.account = null;
        
        // Whether or not we're allowed to make an account active if we successfully authenticate it
        // We will only make an account active if the device doesn't already have an active account.
        this.canMakeAccountActive = true;
        
        // The dsid for the account to authenticate
        // IMPORTANT: It is recommended to use the account property instead
        this.dsid = dsid;
        
        // The title for the default button within the authentication prompt
        this.defaultButtonText = null;
        
        // Headers to add to the authenticate request
        this.headers = {};
        
        // Promote the authenticated account to the current account in the JS
        // NOTE: This does not make the account active on the device. See canMakeAccountActive
        this.makeCurrentAccount = true;
        
        // The title for the authentication prompt
        this.promptTitle = null;
        
        // Enum for authentication type. @see AMSAuthenticateAction.AUTH_TYPES
        this.type = 2;
        
        // The username for the account to authenticate
        this.username = null;
    }
}

AMSAuthenticateAction.AUTH_TYPES = {
    SILENT_PREFERRED: 0,
    SILENT: 1,
    INTERACTIVE: 2
};

class AMSAuthorizeApplePayEnrollmentAction extends AMSAction {
    constructor(paymentSession) {
        super();
        
        // Confirmation style. @see AMSAuthorizeApplePayEnrollmentAction.CONFIRMATION_STYLE
        this.confirmationStyle = 0;

        // Pass serial number
        this.passSerialNumber = null;
        
        // Pass type identifier
        this.passTypeIdentifier = null;

        // Payment session
        this.paymentSession = paymentSession;
    }
}

AMSAuthorizeApplePayEnrollmentAction.CONFIRMATION_STYLE = {
    ADD: 0, // Adding a new card
    CONFIRM: 1 // Re-authorizing an existing card
};

// Fetch bag values
class AMSBagAction extends AMSAction {
    constructor(keys) {
        super();
        
        // An array of keys definitions.
        // A key definition should be: { key: "the-bag-key", type: ValueType }
        // For list of ValueTypes, @see AMSBagAction.VALUE_TYPES
        // You can use keypaths to access elements within a dictionary
        this.keys = keys;
    }
}

AMSBagAction.VALUE_TYPES = {
    ARRAY: 0,
    BOOL: 1,
    DOUBLE: 2,
    INTEGER: 3,
    STRING: 4,
    URL: 5,
    DICTIONARY: 6,
};

class AMSBuyAction extends AMSAction {
    constructor(buyParams, dsid) {
        super();
        
        // An account object (e.g AMS.accounts.current)
        this.account = null;
        
        this.buyParameters = buyParams;
        
        // The DSID to use for the buy
        // IMPORTANT: It is recommended to use the account property instead
        this.dsid = dsid;
        
        // True to use the legacy purchase flow. False will use AMS for purchasing.
        this.legacyBuy = false;
        
        // Promote the authenticated account to the current account in the JS
        this.makeCurrentAccount = false;
        
        // A dictionary of metrics events to overlay onto the purchase
        this.metricsOverlay = null;
        
        // String: The profile of the bag to load. If null, will use the bag that the flow was initialized with.
        this.profile = null;
        
        // String: The profile version of the bag to load. If null, will use the bag that the flow was initialized with.
        this.profileVersion = null;
        
        // True if the purchase should prompt for an account, if needed.
        this.requiresAccount = true;
        
        // Enumeration for the type of purchase. @see AMSBuyAction.PURCHASE_TYPES
        this.type = 0;
    }
}

AMSBuyAction.PURCHASE_TYPES = {
    BUY_PRODUCT: 0,
    BACKGROUND_UPDATE_PRODUCT: 1,
    DOWNLOAD_PRODUCT: 2,
    IN_APP_BUY: 3,
    UPDATE_PRODUCT: 4,
    VOLUME_STORE_DOWNLOAD_PRODUCT: 5,
};

class AMSCallbackAction extends AMSAction {
    constructor(service) {
        super();
        
        // The registered service to callback
        this.service = service;
        
        // Data to pass to the callback
        this.data = {};
    }
}

class AMSDelegateAction extends AMSAction {
    constructor() {
        super();
        
        // The data to pass to the delegate of the AMSUI
        this.data = {};
    }
}

class AMSDialogAction extends AMSAction {
    constructor(title, buttons) {
        super();
        
        // The message of the dialog
        this.message = null;
        
        // The title of the dialog
        this.title = title;
        
        // An array of AMSDialogButtonModel objects
        this.buttons = buttons;
        
        // The style of dialog to present
        this.style = 0;
    }
}

AMSDialogAction.DIALOG_STYLE = {
    DEFAULT: 0,
    ALERT: 1,
    ACTION_SHEET: 2
};

class AMSFamilyAction extends AMSAction {
    constructor() {
        super();
        
        // The account object to use. e.g AMS.accounts.current
        this.account = null;
    }
}

class AMSFetchAttestationVersionAction extends AMSAction {
    constructor(account) {
        super();

        // An account object to determine which version it conforms to.
        // e.g AMS.accounts.current
        this.account = account;
    }
}

AMSFetchAttestationVersionAction.BIOMETRICS_ACTION_TYPE = {
    PRIMARY_TOUCH_ID: 0,
    PRIMARY_FACE_ID: 1,
    PRIMARY_SECURITY_PREVENT_REPLAY: 2,
    PRIMARY_CARD_ENROLLMENT: 3,
    PRIMARY_PAYMENT_DIRECTIVE_PASSWORD: 4,
    PRIMARY_PAYMENT_DIRECTIVE_PASSCODE: 5,
    EXTENDED_TOUCH_ID: 6,
    EXTENDED_FACE_ID: 7
};

class AMSFetchCardDataAction extends AMSAction {
    constructor() {
        super();

        // Merchant identifier
        this.merchantID = null;

        // Store front country code
        this.storeFrontCountryCode = null;
    }
}

class AMSFetchCardMetadataAction extends AMSAction {
    constructor() {
        super();

        // Card artwork width, in points. Must be positive (greater than zero), otherwise or if nil card artwork will not be returned.
        this.cardArtworkSize = null;

        // Pass type identifier of a specific card. If nil, will search for all cards in Wallet.
        this.passTypeIdentifier = null;

        // Serial number of a specific card. If nil, will search for all cards in Wallet.
        this.serialNumber = null;
    }
}

const PASS_TYPE_ID_APPLE_CARD = "com.apple.AppleMediaServices.PassTypeIdentifier.AppleCard"

class AMSFlowAction extends AMSAction {
    constructor(presentationType) {
        super();
        
        // Primarily used as passthrough data for the next PageData service callback.
        // However, in the case of a replace presentationType with a replacementType of page,
        // this actionData property should contain a page model.
        this.actionData = {};
        
        // Enum for what kind of animation to perform. @see AMSFlowAction.ANIMATION_TYPES
        this.animationType = 0;
        
        // Defer presentation of the next page until the page refresh has completed
        this.deferredPresentation = false;
        
        // @see AMSWebPageModel for possible values
        this.backgroundColor = null;
        
        // AMSLoadingPageModel
        this.loadingPage = null;
        
        // Window size for any modal presentation on macOS.
        // Type: Array; Example: [<width>, <height>]
        this.modalWindowSize = null;
        
        // AMSNavigationBarModel
        this.navigationBar = null;
        
        // The index to pop to relative to the root container's index.
        // presentationType must be set to `AMSFlowAction.PRESENTATION_TYPES.POP`.
        this.popToRelativeIndex = null;
        
        // Enum for what kind of presentation to perform. @see AMSFlowAction.PRESENTATION_TYPES
        this.presentationType = presentationType;
        
        // Enum representing which type of replacement to perform. @see AMSFlowAction.REPLACEMENT_TYPES
        this.replacementType = 0;
        
        // A page model for use with the page replacement type
        this.replacementPage = null;
    }
}

AMSFlowAction.ANIMATION_TYPES = {
    NONE: 0,
    DEFAULT: 1,
    CROSS_DISOLVE: 2,
    COVER_VERTICAL: 3,
};

AMSFlowAction.PRESENTATION_TYPES = {
    REPLACE: 0,
    FULLSCREEN: 1,
    PUSH: 2,
    FORM_SHEET: 3,
    DISMISS: 4,
    POP: 5,
};

AMSFlowAction.REPLACEMENT_TYPES = {
    RELOAD: 0,  // Triggers the 'PageData' service callback. Will replace with placeholder and set timeout.
    PAGE: 1,    // Direct model replacement. replacementPage must be set to a page model
};

class AMSLoadPluginAction extends AMSAction {
    constructor(bundleIdentifier) {
        super();
        
        // The bundle identifier of the plugin
        this.bundleIdentifier = bundleIdentifier;
    }
}

class AMSMarketingItemAction extends AMSAction {
    constructor(clientIdentifier, clientVersion, placement, serviceType, dsid) {
        super();
        
        // An account object. Provide null for anonymized requests.
        // e.g AMS.accounts.current
        this.account = null;
        
        // String
        // Client ID of the requester
        this.clientIdentifier = clientIdentifier;
        
        // String
        // Client version of the requester
        this.clientVersion = clientVersion;
        
        // String
        // The position of the item relative to the client
        this.placement = placement;
        
        // String
        // The service type the marketing item should include.
        this.serviceType = serviceType;
        
        // String
        // The user's dsid. Provide null for anonymized requests.
        // IMPORTANT: It is recommended to use the account property instead
        this.dsid = dsid;
        
        // Optional dictionary
        // Additional parameters, agreed upon by the server, to attach to the request.
        this.contextInfo = null;
    }
}

class AMSMediaAction extends AMSAction {
    constructor(type) {
        super();
    
        // The type of media. @see AMSMediaAction.MEDIA_TYPES
        this.type = type;
        
        // Array of strings containing bundle IDs.
        this.bundleIdentifiers = null;
        
        // Client ID for the request.
        this.clientIdentifier = null;
        
        // Client version for the request.
        this.clientVersion = null;
        
        // Array of string containing adam IDs
        this.itemIdentifiers = null;
        
        // Array of strings corresponding to keys to include in the server response
        this.includedResultKeys = null;
    }
}

AMSMediaAction.MEDIA_TYPES = {
    APP: 0,
    APP_BUNDLE: 1,
    IN_APP: 2,
};

class AMSMetricsAction extends AMSAction {
    constructor(events) {
        super();

        // An array of AMSMetricsEvent objects
        this.events = events;
        
        // Set to True to trigger an immediate flush. Otherwise, the standard flush interval will be used.
        this.flush = false;
    }
}

class AMSMetricsEvent {
    constructor(topic, fields, dsid) {
        // An account object for personalizing the metrics request. Leave null for unpersonalized
        // e.g AMS.accounts.current
        this.account = null;
        
        // A dsid for personalizing the metrics request.
        // IMPORTANT: It is recommended to use the account property instead
        this.dsid = dsid;
        
        // A dictionary of fields
        this.fields = fields;
        
        // A topic for the event
        this.topic = topic;
    }
}

class AMSNetworkAction extends AMSAction {
    constructor(url) {
        super();
        
        // An account object to use on network requests. Leave null for unpersonalized request.
        // e.g AMS.accounts.current
        this.account = null;
        
        // The body of the request, as a UTF8 encoded string
        this.body = null;
        
        // The dsid to use with the request. Or leave null to perform an unpersonalized request
        // IMPORTANT: It is recommended to use the account property instead
        this.dsid = null;
        
        // A dictionary of request headers
        this.headers = {};
        
        // The request method
        this.method = "GET";
        
        // The request URL
        this.url = url;
        
        // True to add iCloud tokens, such as gs-token, to the request
        this.includeiCloudTokens = false;
    }
}

class AMSOpenSafariAction extends AMSAction {
    constructor(url) {
        super();
        
        this.callbackScheme = null;
        
        this.url = url;
    }
}

class AMSOpenFamilyCircleAction extends AMSAction {
    constructor() {
        super();
        
        // The client name for the family circle request
        this.clientName = null;
    }
}

class AMSOpenURLAction extends AMSAction {
    constructor(url) {
        super();
        
        // See AMSOpenURLAction.OPEN_TYPE
        this.type = 0;
        
        // The url to deep link to
        this.url = url;
    }
}

AMSOpenURLAction.OPEN_TYPE = {
    STANDARD: 0,
    // Attempt to open in the current app. Otherwise, use standard open.
    ATTEMPT_APP: 1,
    // Open as universal link. If not a recognizable universal link, fail.
    UNIVERSAL_LINK: 2,
}

class AMSOTPAction extends AMSAction {
    constructor() {
        super();
        
        this.enabled = true;
    }
}

class AMSPluginAction extends AMSAction {
    constructor(bundleIdentifier, actionIdentifier) {
        super();
        
        // The identifier of the action
        this.actionIdentifier = actionIdentifier;
        
        // The bundle identifier of the plugin
        this.bundleIdentifier = bundleIdentifier;
        
        // A dictionary of action options
        this.options = null;
    }
}

class AMSSendSMSAction extends AMSAction {
    constructor(body, digits) {
        super();

        // The message body
        this.body = body;

        // The country code
        this.countryCode = null;

        // The digits
        this.digits = digits;
    }
}

class AMSSubscriptionAction extends AMSAction {
    constructor() {
        super();
        
        // The cache policy
        this.cachePolicy = 0;
        
        // See AMSSubscriptionAction.MEDIA_TYPES
        this.mediaType = 1;
        
        // True if the status should perform additional carrier bundling checks
        this.extendedCarrierCheck = false;
    }
}

AMSSubscriptionAction.CACHE_POLICY = {
    CACHE_PREFERRED: 0,
    IGNORE_CACHE: 1,
    CACHE_ONLY: 2,
};

AMSSubscriptionAction.MEDIA_TYPES = {
    ACTIVITY: 0,
    APP_STORE: 1,
    MUSIC: 2,
    NEWS: 3,
    TV: 4,
    ICLOUD: 5,
    PODCAST: 6,
};

AMSSubscriptionAction.RESPONSE_STATUS = {
    NOT_ENTITLED: 0,
    ENTITLED: 1,
    REQUIRES_VERIFICATION: 2,
    UNLINKED: 3,
};

AMSSubscriptionAction.RESPONSE_SOURCE = {
    UNKNOWN: 0,
    Apple: 1,
    Carrier: 2
};

// Dont use unless you know what you are doing. Use AMSAuthenticateAction instead
class AMSVerifyCredentialsAction extends AMSAction {
    constructor() {
        super();
     
        // An account object (e.g AMS.accounts.current)
        this.account = null;
        
        // The text for the button. Leave null to use the default.
        this.buttonText = null;
        
        // Whether to persist any state that is used.
        this.ephemeral = false;
        
        // The service identifier to use for the verification. Leave null to use the default.
        this.serviceIdentifier = null;
        
        // See AMSVerifyCredentialsAction.SERVICE_TYPE
        this.serviceType = 0;
        
        // The subtitle for the login UI. Leave null to use the default.
        this.subtitle = null;
        
        // The title for the login UI. Leave null to use the default.
        this.title = null;
        
        // macOS only. True to prevent the username from being modified.
        this.usernameEditable = false;
    }
}

AMSVerifyCredentialsAction.SERVICE_TYPE = {
    STORE: 0,
    ICLOUD: 1
}

class AMSVerifyPaymentSetupFeatureAction extends AMSAction {
    constructor(referrerIdentifier) {
        super();

        // Analytics identifier consumed by Wallet. If nil, the default AMP analytics identifier will be used.
        this.referrerIdentifier = referrerIdentifier;
    }
}
