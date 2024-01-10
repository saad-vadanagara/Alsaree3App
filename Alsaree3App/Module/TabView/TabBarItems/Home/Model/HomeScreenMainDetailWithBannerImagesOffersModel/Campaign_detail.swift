

import Foundation
struct Campaign_detail : Codable {
	let pop_up_type : String?
	let pop_up_title : String?
	let pop_up_text : String?
	let offer_image_url : String?
	let store_id : String?
	let is_alsaree3_essential : Bool?

	enum CodingKeys: String, CodingKey {

		case pop_up_type = "pop_up_type"
		case pop_up_title = "pop_up_title"
		case pop_up_text = "pop_up_text"
		case offer_image_url = "offer_image_url"
		case store_id = "store_id"
		case is_alsaree3_essential = "is_alsaree3_essential"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pop_up_type = try values.decodeIfPresent(String.self, forKey: .pop_up_type)
		pop_up_title = try values.decodeIfPresent(String.self, forKey: .pop_up_title)
		pop_up_text = try values.decodeIfPresent(String.self, forKey: .pop_up_text)
		offer_image_url = try values.decodeIfPresent(String.self, forKey: .offer_image_url)
		store_id = try values.decodeIfPresent(String.self, forKey: .store_id)
		is_alsaree3_essential = try values.decodeIfPresent(Bool.self, forKey: .is_alsaree3_essential)
	}

}
