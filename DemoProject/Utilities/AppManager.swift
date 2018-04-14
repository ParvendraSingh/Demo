
import UIKit

class AppManager {
    
    class func sharedInstance() -> AppManager? {
        var appManager: AppManager? = nil
        if appManager == nil {
            appManager = AppManager()
        }
        return appManager
    }
    
}
