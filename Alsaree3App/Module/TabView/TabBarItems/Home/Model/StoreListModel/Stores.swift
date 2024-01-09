/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Stores : Codable {
	let _id : String?
	let is_show_top : Bool?
	let completed_order_count : Int?
	let user_rate : Double?
	let qr_image_url : String?
	let is_promocode_exception : Bool?
	let extra_delivery_charge : Int?
	let is_discount_on_delivery_price : Bool?
	let delivery_price_after_discount : Int?
	let is_alsaree3_essential : Bool?
	let name : String?
	let email : String?
	let image_url : String?
	let is_pharmacy_or_grocery : Bool?
	let delivery_time : Int?
	let delivery_time_max : Int?
	let user_rate_count : Int?
	let delivery_radius : Int?
	let website_url : String?
	let slogan : String?
	let is_visible : Bool?
	let is_store_busy : Bool?
	let phone : String?
	let country_phone_code : String?
	let famous_products_tags : [String]?
	let store_time : [Store_time]?
	let location : [Double]?
	let address : String?
	let price_rating : Int?
	let offer : String?
	let is_taking_schedule_order : Bool?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case is_show_top = "is_show_top"
		case completed_order_count = "completed_order_count"
		case user_rate = "user_rate"
		case qr_image_url = "qr_image_url"
		case is_promocode_exception = "is_promocode_exception"
		case extra_delivery_charge = "extra_delivery_charge"
		case is_discount_on_delivery_price = "is_discount_on_delivery_price"
		case delivery_price_after_discount = "delivery_price_after_discount"
		case is_alsaree3_essential = "is_alsaree3_essential"
		case name = "name"
		case email = "email"
		case image_url = "image_url"
		case is_pharmacy_or_grocery = "is_pharmacy_or_grocery"
		case delivery_time = "delivery_time"
		case delivery_time_max = "delivery_time_max"
		case user_rate_count = "user_rate_count"
		case delivery_radius = "delivery_radius"
		case website_url = "website_url"
		case slogan = "slogan"
		case is_visible = "is_visible"
		case is_store_busy = "is_store_busy"
		case phone = "phone"
		case country_phone_code = "country_phone_code"
		case famous_products_tags = "famous_products_tags"
		case store_time = "store_time"
		case location = "location"
		case address = "address"
		case price_rating = "price_rating"
		case offer = "offer"
		case is_taking_schedule_order = "is_taking_schedule_order"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		is_show_top = try values.decodeIfPresent(Bool.self, forKey: .is_show_top)
		completed_order_count = try values.decodeIfPresent(Int.self, forKey: .completed_order_count)
		user_rate = try values.decodeIfPresent(Double.self, forKey: .user_rate)
		qr_image_url = try values.decodeIfPresent(String.self, forKey: .qr_image_url)
		is_promocode_exception = try values.decodeIfPresent(Bool.self, forKey: .is_promocode_exception)
		extra_delivery_charge = try values.decodeIfPresent(Int.self, forKey: .extra_delivery_charge)
		is_discount_on_delivery_price = try values.decodeIfPresent(Bool.self, forKey: .is_discount_on_delivery_price)
		delivery_price_after_discount = try values.decodeIfPresent(Int.self, forKey: .delivery_price_after_discount)
		is_alsaree3_essential = try values.decodeIfPresent(Bool.self, forKey: .is_alsaree3_essential)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
		is_pharmacy_or_grocery = try values.decodeIfPresent(Bool.self, forKey: .is_pharmacy_or_grocery)
		delivery_time = try values.decodeIfPresent(Int.self, forKey: .delivery_time)
		delivery_time_max = try values.decodeIfPresent(Int.self, forKey: .delivery_time_max)
		user_rate_count = try values.decodeIfPresent(Int.self, forKey: .user_rate_count)
		delivery_radius = try values.decodeIfPresent(Int.self, forKey: .delivery_radius)
		website_url = try values.decodeIfPresent(String.self, forKey: .website_url)
		slogan = try values.decodeIfPresent(String.self, forKey: .slogan)
		is_visible = try values.decodeIfPresent(Bool.self, forKey: .is_visible)
		is_store_busy = try values.decodeIfPresent(Bool.self, forKey: .is_store_busy)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
		famous_products_tags = try values.decodeIfPresent([String].self, forKey: .famous_products_tags)
		store_time = try values.decodeIfPresent([Store_time].self, forKey: .store_time)
		location = try values.decodeIfPresent([Double].self, forKey: .location)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		price_rating = try values.decodeIfPresent(Int.self, forKey: .price_rating)
		offer = try values.decodeIfPresent(String.self, forKey: .offer)
		is_taking_schedule_order = try values.decodeIfPresent(Bool.self, forKey: .is_taking_schedule_order)
	}

}