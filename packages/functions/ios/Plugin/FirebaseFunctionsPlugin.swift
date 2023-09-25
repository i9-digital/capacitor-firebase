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
        guard let name = call.getString("name"),
              let data = call.getObject("data") else {
            call.reject("Missing parameters")
            return
        }

        implementation?.httpsCallable(name: name, data: data, completion:
          { resultData, error in
            if let error = error {
                call.reject(error.localizedDescription)
                return
            }
            var result = JSObject()
            result["data"] = resultData
            call.resolve(result)
        })
    }
}
