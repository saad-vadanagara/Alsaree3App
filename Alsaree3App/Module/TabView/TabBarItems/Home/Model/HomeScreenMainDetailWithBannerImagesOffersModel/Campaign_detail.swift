/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

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