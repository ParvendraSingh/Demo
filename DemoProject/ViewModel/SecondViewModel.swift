
import UIKit

class SecondViewModel {
     var secondModelWithDictionary: [SecondModelWithDictionary]!
    
    // for codable 2
    //var  json4Swift_BaseClass : Json4Swift_Base!
    
    // for codable 3
    var  codable3Base : Codable3Base!
    
    // MARK: - fetchDataWithDictionary
    
    func fetchDataWithDictionary(completion: @escaping (_ success: Bool?) -> Void) {
        WebServiceClass.sharedInstance()?.get(Constants.testingApi.kBaseURL, completion: {(response, error) in
            if error != nil {
                completion(false)
            }
            else {
                print(response ?? "")
                let restResponse = response?.value(forKey: "RestResponse")
                let result = (restResponse as AnyObject).value(forKey: "result") as? NSArray
                if ((result?.count) != 0) {
                    self.secondModelWithDictionary = SecondModelWithDictionary.modelsFromDictionaryArray(array: result!)
                    completion(true)
                }
                else {
                    completion(false)
                }
            }
        })
    }

//    func numberOfRowsInSection(section: Int) -> Int {
//        return self.secondModelWithDictionary?.count ?? 0
//    }
//
//    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
//        var details: SecondModelWithDictionary?
//        details = self.secondModelWithDictionary[indexPath.row]
//        return (details?.name)!
//    }
    
    // MARK: - fetchDataWithCodable
    
    func fetchDataWithCodable(completion: @escaping (_ success: Bool?) -> Void) {
        WebServiceClass.sharedInstance()?.getForCodable(Constants.testingApi.kBaseURL, completion: {(data, error) in
            if error != nil {
                completion(false)
            }
            else {
                do {
                    
                    let jsonDecoder = JSONDecoder()
                    
                    // For codable 2
//                    let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data! as Data)
//                    self.json4Swift_BaseClass = responseModel
//                    print(responseModel.data)
                    
                    // For codable 3
                    let responseModel = try jsonDecoder.decode(Codable3Base.self, from: data! as Data)
                    self.codable3Base = responseModel
                    print(responseModel.response)
                    
                    completion(true)
                }
                catch let err {
                    print("Err", err)
                    completion(false)
                }
            }
        })
    }
    
//    // For codable 2
//    func numberOfRowsInSection(section: Int) -> Int {
//        guard (self.json4Swift_BaseClass) != nil else{
//            return 0
//        }
//        return (self.json4Swift_BaseClass.data?.count)!
//    }
//
//    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
//        var details: DataResponse?
//        details = self.json4Swift_BaseClass.data?[indexPath.row]
//        return ((details?.first_name)! + (details?.last_name)!)
//    }

    // For codable 3
    func numberOfRowsInSection(section: Int) -> Int {
        guard (self.codable3Base) != nil else{
            return 0
        }
        return (self.codable3Base.response?.count)!
    }
    
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
        var details: Response?
        details = self.codable3Base.response?[indexPath.row]
        return ((details?.title)! + (details?.tip1)!)
    }
    
}
