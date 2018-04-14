
import Foundation
struct Response : Codable {
	let id_diseases : String?
	let title : String?
	let slug : String?
	let tip1 : String?
	let tip2 : String?
	let tip3 : String?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case id_diseases = "id_diseases"
		case title = "title"
		case slug = "slug"
		case tip1 = "tip1"
		case tip2 = "tip2"
		case tip3 = "tip3"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id_diseases = try values.decodeIfPresent(String.self, forKey: .id_diseases)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		tip1 = try values.decodeIfPresent(String.self, forKey: .tip1)
		tip2 = try values.decodeIfPresent(String.self, forKey: .tip2)
		tip3 = try values.decodeIfPresent(String.self, forKey: .tip3)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
