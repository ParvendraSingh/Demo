

import Foundation
struct SecondModel : Codable {
	
    let restResponse : RestResponse?

	enum CodingKeys: String, CodingKey {
		case restResponse
	}

	init(from decoder: Decoder) throws {
		//let values = try decoder.container(keyedBy: CodingKeys.self)
		restResponse = try RestResponse(from: decoder)
	}
}




