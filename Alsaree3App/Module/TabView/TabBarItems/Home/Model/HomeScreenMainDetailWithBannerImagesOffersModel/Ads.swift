/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Ads : Codable {
	let _id : String?
	let ads_detail : String?
	let is_ads_cc : Bool?
	let expiry_date : String?
	let start_time : String?
	let end_time : String?
	let is_ads_visible : Bool?
	let is_ads_redirect_to_store : Bool?
	let image_url : String?
	let new_design_image_url : String?
	let store_id : String?
	let store_radius : Int?
	let is_store_open : Bool?
	let location : [Double]?
	let store_offers_detail : Store_offers_detail?
	let is_ads_on : Bool?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case ads_detail = "ads_detail"
		case is_ads_cc = "is_ads_cc"
		case expiry_date = "expiry_date"
		case start_time = "start_time"
		case end_time = "end_time"
		case is_ads_visible = "is_ads_visible"
		case is_ads_redirect_to_store = "is_ads_redirect_to_store"
		case image_url = "image_url"
		case new_design_image_url = "new_design_image_url"
		case store_id = "store_id"
		case store_radius = "store_radius"
		case is_store_open = "is_store_open"
		case location = "location"
		case store_offers_detail = "store_offers_detail"
		case is_ads_on = "is_ads_on"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		ads_detail = try values.decodeIfPresent(String.self, forKey: .ads_detail)
		is_ads_cc = try values.decodeIfPresent(Bool.self, forKey: .is_ads_cc)
		expiry_date = try values.decodeIfPresent(String.self, forKey: .expiry_date)
		start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
		end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
		is_ads_visible = try values.decodeIfPresent(Bool.self, forKey: .is_ads_visible)
		is_ads_redirect_to_store = try values.decodeIfPresent(Bool.self, forKey: .is_ads_redirect_to_store)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		new_design_image_url = try values.decodeIfPresent(String.self, forKey: .new_design_image_url)
		store_id = try values.decodeIfPresent(String.self, forKey: .store_id)
		store_radius = try values.decodeIfPresent(Int.self, forKey: .store_radius)
		is_store_open = try values.decodeIfPresent(Bool.self, forKey: .is_store_open)
		location = try values.decodeIfPresent([Double].self, forKey: .location)
		store_offers_detail = try values.decodeIfPresent(Store_offers_detail.self, forKey: .store_offers_detail)
		is_ads_on = try values.decodeIfPresent(Bool.self, forKey: .is_ads_on)
	}

}