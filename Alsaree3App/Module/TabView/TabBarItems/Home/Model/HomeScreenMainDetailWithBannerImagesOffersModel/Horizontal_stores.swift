/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Horizontal_stores : Codable {
	let _id : String?
	let created_at : String?
	let qr_image_url : String?
	let distance : Double?
	let name : String?
	let email : String?
	let extra_delivery_charge : Int?
	let is_discount_on_delivery_price : Bool?
	let delivery_price_after_discount : Int?
	let image_url : String?
	let delivery_time : Int?
	let delivery_time_max : Int?
	let user_rate : Float?
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
		case created_at = "created_at"
		case qr_image_url = "qr_image_url"
		case distance = "distance"
		case name = "name"
		case email = "email"
		case extra_delivery_charge = "extra_delivery_charge"
		case is_discount_on_delivery_price = "is_discount_on_delivery_price"
		case delivery_price_after_discount = "delivery_price_after_discount"
		case image_url = "image_url"
		case delivery_time = "delivery_time"
		case delivery_time_max = "delivery_time_max"
		case user_rate = "user_rate"
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


}
