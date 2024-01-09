
import Foundation
struct StoreListModel: Codable {
	let success : Bool?
	let message : Int?
	let server_time : String?
	let store_count : Int?
	let stores : [Stores]?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case message = "message"
		case server_time = "server_time"
		case store_count = "store_count"
		case stores = "stores"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		message = try values.decodeIfPresent(Int.self, forKey: .message)
		server_time = try values.decodeIfPresent(String.self, forKey: .server_time)
		store_count = try values.decodeIfPresent(Int.self, forKey: .store_count)
		stores = try values.decodeIfPresent([Stores].self, forKey: .stores)
	}

}
