//
//  JSLogger.js
//  AppleMediaServicesUI
//
//  Created by Daniel Jackson on 09/30/19.
//  Copyright © 2019 Apple, Inc. All rights reserved.
//

class AMSLog {
    // level corresponds to the level of os_log to record. @see AMSLog.LOG_LEVEL
    static send(level, msg) {
        if (AMS.device.buildType == "internal") {
            AMS.run({ actionClass: "AMSLogAction", level: level, message: msg });
        }
    }
    
    static debug(msg) {
        this.send(AMSLog.LOG_LEVEL.DEBUG, msg);
    }
    
    static default(msg) {
        this.send(AMSLog.LOG_LEVEL.DEFAULT, msg);
    }
    
    static error(msg) {
        this.send(AMSLog.LOG_LEVEL.ERROR, msg);
    }
    
    static info(msg) {
        this.send(AMSLog.LOG_LEVEL.INFO, msg);
    }
    
    static fault(msg) {
        this.send(AMSLog.LOG_LEVEL.FAULT, msg);
    }
}

AMSLog.LOG_LEVEL = {
    DEBUG: 0,
    DEFAULT: 1,
    ERROR: 2,
    INFO: 3,
    FAULT: 4,
};

// MARK: - Overrides

const __oldConsoleLogFunc = window.console.log;
window.console.log = function(obj) {
    // NOTE: This will drop the log line in the inspector, but is worth it to see them in the sysdiagnose.
    __oldConsoleLogFunc(obj);
    AMSLog.default(obj);
};

const __oldConsoleErrorFunc = window.console.error;
window.console.error = function(obj) {
    // NOTE: This will drop the log line in the inspector, but is worth it to see them in the sysdiagnose.
    __oldConsoleErrorFunc(obj);
    AMSLog.error(obj);
};
