import Capacitor
import FirebaseCore
import FirebaseFunctions

@objc public class FirebaseFunctions: NSObject {

    lazy var functions = Functions.functions()

    override init() {
        super.init()
    }

    public func httpsCallable(name: String, data: [String: Any], completion: @escaping (String?, Error?) -> Void) {
        
        functions.httpsCallable(name).call(data) { (result, error) in
            if let error = error {
                completion(nil,error)
                return
            }
            
            if let resultData = result?.data {
                completion(resultData as? String, nil)
            } else {
                let unexpectedDataError = NSError(domain: "CapacitorFirebase.Functions", code: 500, userInfo: nil)
                completion(nil, unexpectedDataError)
            }
        }
    }


}
