
import Foundation

public class SecondModelWithDictionary {
	public var name : String?
	public var alpha2_code : String?
	public var alpha3_code : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let secondModelWithDictionary_list = SecondModelWithDictionary.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of SecondModelWithDictionary Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [SecondModelWithDictionary]
    {
        var models:[SecondModelWithDictionary] = []
        for item in array
        {
            models.append(SecondModelWithDictionary(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let secondModelWithDictionary = SecondModelWithDictionary(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: SecondModelWithDictionary Instance.
*/
	required public init?(dictionary: NSDictionary) {
		name = dictionary["name"] as? String
		alpha2_code = dictionary["alpha2_code"] as? String
		alpha3_code = dictionary["alpha3_code"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {
		let dictionary = NSMutableDictionary()
		dictionary.setValue(self.name, forKey: "name")
		dictionary.setValue(self.alpha2_code, forKey: "alpha2_code")
		dictionary.setValue(self.alpha3_code, forKey: "alpha3_code")
		return dictionary
	}

}
