import Foundation
import Capacitor

import FirebaseCore

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(FirebaseFunctionsPlugin)
public class FirebaseFunctionsPlugin: CAPPlugin {
    private var implementation: FirebaseFunctions?

    override public func load() {
        implementation = FirebaseFunctions()
    }

    @objc func httpsCallable(_ call: CAPPluginCall) {
        let appInstanceId = implementation?.httpsCallable()
        var result = JSObject()
        if appInstanceId != nil {
            result["appInstanceId"] = appInstanceId
        }
        call.resolve(result)
    }
}
