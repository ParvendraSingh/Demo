
import Foundation

struct RestResponse : Codable {
	
    let messages : [String]?
	let result : [Result]?

	enum CodingKeys: String, CodingKey {
		case messages = "messages"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		messages = try values.decodeIfPresent([String].self, forKey: .messages)
		result = try values.decodeIfPresent([Result].self, forKey: .result)
	}

}
