/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Store_offers : Codable {
	let name : String?
	let image_url : String?
	let is_promocode_exception : Bool?
	let is_taking_schedule_order : Bool?
	let address : String?
	let price_rating : Int?
	let offer : String?
	let location : [Double]?
	let famous_products_tags : [String]?
	let store_time : [Store_time]?
	let country_phone_code : String?
	let extra_delivery_charge : Int?
	let is_discount_on_delivery_price : Bool?
	let delivery_price_after_discount : Int?
	let delivery_time_max : Int?
	let delivery_time : Int?
	let email : String?
	let is_alsaree3_essential : Bool?
	let qr_image_url : String?
	let _id : String?
	let created_at : String?
	let phone : String?
	let is_pharmacy_or_grocery : Bool?
	let is_store_busy : Bool?
	let is_store_open : Bool?
	let is_visible : Bool?
	let is_show_top : Bool?
	let slogan : String?
	let website_url : String?
	let delivery_radius : Int?
	let user_rate_count : Int?
	let user_rate : Double?
	let distance : Double?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case image_url = "image_url"
		case is_promocode_exception = "is_promocode_exception"
		case is_taking_schedule_order = "is_taking_schedule_order"
		case address = "address"
		case price_rating = "price_rating"
		case offer = "offer"
		case location = "location"
		case famous_products_tags = "famous_products_tags"
		case store_time = "store_time"
		case country_phone_code = "country_phone_code"
		case extra_delivery_charge = "extra_delivery_charge"
		case is_discount_on_delivery_price = "is_discount_on_delivery_price"
		case delivery_price_after_discount = "delivery_price_after_discount"
		case delivery_time_max = "delivery_time_max"
		case delivery_time = "delivery_time"
		case email = "email"
		case is_alsaree3_essential = "is_alsaree3_essential"
		case qr_image_url = "qr_image_url"
		case _id = "_id"
		case created_at = "created_at"
		case phone = "phone"
		case is_pharmacy_or_grocery = "is_pharmacy_or_grocery"
		case is_store_busy = "is_store_busy"
		case is_store_open = "is_store_open"
		case is_visible = "is_visible"
		case is_show_top = "is_show_top"
		case slogan = "slogan"
		case website_url = "website_url"
		case delivery_radius = "delivery_radius"
		case user_rate_count = "user_rate_count"
		case user_rate = "user_rate"
		case distance = "distance"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		is_promocode_exception = try values.decodeIfPresent(Bool.self, forKey: .is_promocode_exception)
		is_taking_schedule_order = try values.decodeIfPresent(Bool.self, forKey: .is_taking_schedule_order)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		price_rating = try values.decodeIfPresent(Int.self, forKey: .price_rating)
		offer = try values.decodeIfPresent(String.self, forKey: .offer)
		location = try values.decodeIfPresent([Double].self, forKey: .location)
		famous_products_tags = try values.decodeIfPresent([String].self, forKey: .famous_products_tags)
		store_time = try values.decodeIfPresent([Store_time].self, forKey: .store_time)
		country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
		extra_delivery_charge = try values.decodeIfPresent(Int.self, forKey: .extra_delivery_charge)
		is_discount_on_delivery_price = try values.decodeIfPresent(Bool.self, forKey: .is_discount_on_delivery_price)
		delivery_price_after_discount = try values.decodeIfPresent(Int.self, forKey: .delivery_price_after_discount)
		delivery_time_max = try values.decodeIfPresent(Int.self, forKey: .delivery_time_max)
		delivery_time = try values.decodeIfPresent(Int.self, forKey: .delivery_time)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		is_alsaree3_essential = try values.decodeIfPresent(Bool.self, forKey: .is_alsaree3_essential)
		qr_image_url = try values.decodeIfPresent(String.self, forKey: .qr_image_url)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		is_pharmacy_or_grocery = try values.decodeIfPresent(Bool.self, forKey: .is_pharmacy_or_grocery)
		is_store_busy = try values.decodeIfPresent(Bool.self, forKey: .is_store_busy)
		is_store_open = try values.decodeIfPresent(Bool.self, forKey: .is_store_open)
		is_visible = try values.decodeIfPresent(Bool.self, forKey: .is_visible)
		is_show_top = try values.decodeIfPresent(Bool.self, forKey: .is_show_top)
		slogan = try values.decodeIfPresent(String.self, forKey: .slogan)
		website_url = try values.decodeIfPresent(String.self, forKey: .website_url)
		delivery_radius = try values.decodeIfPresent(Int.self, forKey: .delivery_radius)
		user_rate_count = try values.decodeIfPresent(Int.self, forKey: .user_rate_count)
		user_rate = try values.decodeIfPresent(Double.self, forKey: .user_rate)
		distance = try values.decodeIfPresent(Double.self, forKey: .distance)
	}

}