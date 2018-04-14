
import Foundation
struct Result : Codable {
	
    let name : String?
	let alpha2_code : String?
	let alpha3_code : String?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case alpha2_code = "alpha2_code"
		case alpha3_code = "alpha3_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		alpha2_code = try values.decodeIfPresent(String.self, forKey: .alpha2_code)
		alpha3_code = try values.decodeIfPresent(String.self, forKey: .alpha3_code)
	}

}
