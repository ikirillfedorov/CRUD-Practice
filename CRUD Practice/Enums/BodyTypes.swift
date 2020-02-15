//
//  BodyTypes.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 14.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

enum BodyTypes: String {
	case sedan = "Hatchback"
	case hatchback = "Sedan"
	case crossover = "MUV/SUV"
	case coupe = "Coupe"
	case convertible = "Convertible"
	case wagon = "Wagon"
	case van = "Van"
	case jeep = "Jeep"
}


enum TextFieldType: Int {
	case manufactureDateField = 1
	case bodyTypeField = 2
}
