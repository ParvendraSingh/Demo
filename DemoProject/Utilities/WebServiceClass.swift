
import UIKit

class WebServiceClass {
    
    let GET = "GET"
    let POST = "POST"
    var dataTask: URLSessionDataTask?
    
    class func sharedInstance() -> WebServiceClass? {
        var webServiceClassObj: WebServiceClass? = nil
        if webServiceClassObj == nil {
            webServiceClassObj = WebServiceClass()
        }
        return webServiceClassObj
    }
    
    // For Dictionary Model
    func get(_ requestUrl: String?, completion: @escaping (_ result: NSDictionary?, _ error: Error?)  -> Void) {
        URLSession.shared.dataTask(with: URL(string:requestUrl!)!) { (data, response
            , error) in
            guard let data = data else { return }
            if error != nil {
                let json: NSDictionary? = nil
                completion(json!, error!)
            }
            else {
                if let json = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? NSDictionary {
                    completion(json, error)
                }
            }
            }.resume()
    }
    
    
    // For Codable Model
    func getForCodable(_ requestUrl: String?, completion: @escaping (_ result: NSData?, _ error: Error?)  -> Void) {
        URLSession.shared.dataTask(with: URL(string:requestUrl!)!) { (data, response
            , error) in
            guard let data = data else { return }
            if error != nil {
                let json: NSData? = nil
                completion(json!, error!)
            }
            else {
                completion(data as NSData, error)
            }
            }.resume()
    }
    
    
    
    func get(_ requestUrl: String?, parameters: NSDictionary?, completion: @escaping (_ result: NSDictionary?, _ error: Error?) -> Void) {
        // fetch the data
        var urlRequest = URLRequest(url: URL(string:requestUrl!)!)
        urlRequest.httpMethod = GET
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: []) else {
            return
        }
        urlRequest.httpBody = httpBody
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        dataTask?.cancel()
        dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("------------------------------------------------------------------------------------")
            print("REQUEST:")
            print(requestUrl!)
            print("PARAM:")
            print(parameters!)
            print("RESPONSE:")
            print(strData!)
            print("------------------------------------------------------------------------------------")
            
            // handler
            if error != nil {
                // TODO: check the response error...
                let json: NSDictionary? = nil
                completion(json!, error!)
            }
            else {
                // TODO: check the response status code...
                if let json = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? NSDictionary {
                    completion(json, error)
                }
            }
        })
        dataTask?.resume()
    }
    
    func get(_ requestUrl: String?, token: String?, completion: @escaping (_ result: NSData?, _ error: Error?)  -> Void) {
        // fetch the data
        var urlRequest = URLRequest(url: URL(string:requestUrl!)!)
        urlRequest.httpMethod = GET
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        dataTask?.cancel()
        dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("------------------------------------------------------------------------------------")
            print("REQUEST:")
            print(requestUrl!)
            print("TOKEN:")
            print(token!)
            print("RESPONSE:")
            print(strData!)
            print("------------------------------------------------------------------------------------")
            
            // handler
            if error != nil {
                // TODO: check the response error...
                let json: NSData? = nil
                completion(json!, error!)
            }
            else {
                // TODO: check the response status code...
                completion(data! as NSData, error)
            }
        })
        dataTask?.resume()
    }
    
    
//    func get(_ requestUrl: String?, token: String?, completion: @escaping (_ result: NSDictionary?, _ error: Error?)  -> Void) {
//        // fetch the data
//        var urlRequest = URLRequest(url: URL(string:requestUrl!)!)
//        urlRequest.httpMethod = GET
//        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
//        urlRequest.setValue("bearer \(token!)", forHTTPHeaderField: "Authorization")
//
//        let session = URLSession(configuration: URLSessionConfiguration.default)
//
//        dataTask?.cancel()
//        dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in

//
//            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//
//            print("------------------------------------------------------------------------------------")
//            print("REQUEST:")
//            print(requestUrl!)
//            print("TOKEN:")
//            print(token!)
//            print("RESPONSE:")
//            print(strData!)
//            print("------------------------------------------------------------------------------------")
//
//            // handler
//            if error != nil {
//                // TODO: check the response error...
//                let json: NSDictionary? = nil
//                completion(json!, error!)
//            }
//            else {
//                // TODO: check the response status code...
//                if let json = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? NSDictionary {
//                    completion(json, error)
//                }
//            }
//        })
//        dataTask?.resume()
//    }
//
    func post(_ requestUrl: String?, parameters: NSDictionary?, completion: @escaping (_ result: NSDictionary?, _ error: Error?) -> Void) {
        // fetch the data
        var urlRequest = URLRequest(url: URL(string:requestUrl!)!)
        urlRequest.httpMethod = POST
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: []) else {
            return
        }
        urlRequest.httpBody = httpBody
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        dataTask?.cancel()
        dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("------------------------------------------------------------------------------------")
            print("REQUEST:")
            print(requestUrl!)
            print("PARAM:")
            print(parameters!)
            print("RESPONSE:")
            print(strData!)
            print("------------------------------------------------------------------------------------")
            
            // handler
            if error != nil {
                // TODO: check the response error...
                let json: NSDictionary? = nil
                completion(json!, error!)
            }
            else {
                // TODO: check the response status code...
                if let json = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? NSDictionary {
                    completion(json, error)
                }
            }
        })
        dataTask?.resume()
    }
    func post(_ requestUrl: String?, parameters: NSDictionary?, token: String?, completion: @escaping (_ result: NSDictionary?, _ error: Error?) -> Void) {
        // fetch the data
        var urlRequest = URLRequest(url: URL(string:requestUrl!)!)
        urlRequest.httpMethod = POST
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("bearer \(token!)", forHTTPHeaderField: "Authorization")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: []) else {
            return
        }
        urlRequest.httpBody = httpBody
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        dataTask?.cancel()
        dataTask = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("------------------------------------------------------------------------------------")
            print("REQUEST:")
            print(requestUrl!)
            print("PARAM:")
            print(parameters!)
            print("RESPONSE:")
            print(strData!)
            print("------------------------------------------------------------------------------------")
            
            // handler
            if error != nil {
                // TODO: check the response error...
                let json: NSDictionary? = nil
                completion(json!, error!)
            }
            else {
                // TODO: check the response status code...
                if let json = (try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)) as? NSDictionary {
                    completion(json, error)
                }
            }
        })
        dataTask?.resume()
    }
    
}
