
import Foundation
struct Codable3Base : Codable {
	let message : String?
	let status : Int?
	let response : [Response]?

	enum CodingKeys: String, CodingKey {

		case message = "message"
		case status = "status"
		case response = "response"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		response = try values.decodeIfPresent([Response].self, forKey: .response)
	}

}
