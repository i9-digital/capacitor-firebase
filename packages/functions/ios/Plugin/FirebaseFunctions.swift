import Capacitor
import FirebaseCore
import FirebaseFunctions

@objc public class FirebaseFunctions: NSObject {

    lazy var functions = Functions.functions()

    override init() {
        super.init()
    }

    @objc public func httpsCallable(_ call: CAPPluginCall) {
        guard let name = call.getString("name"),
              let data = call.getObject("data") else {
            call.reject("Missing parameters")
            return
        }
        
        functions.httpsCallable(name).call(data) { result, error in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                }
                call.reject(error.localizedDescription, nil, error)
                return
            }

            if let resultData = (result?.data as? [String: Any?]) {
                let resultJSObject = JSObject(data: resultData)
                call.resolve(resultJSObject)
            }
        }
    }
}
