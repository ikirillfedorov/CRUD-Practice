//
//  Car.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

struct Car: Codable {
	let model: String
	let manufacturer: String
	let manufactureDate: Date
	let bodyType: String
	let id: String
	
	init(model: String, manufacturer: String, manufactureDate: Date, bodyType: String, id: String?) {
		self.model = model
		self.manufacturer = manufacturer
		self.manufactureDate = manufactureDate
		self.bodyType = bodyType
		self.id = id ?? UUID().uuidString
	}
}
