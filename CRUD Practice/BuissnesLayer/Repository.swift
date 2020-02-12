//
//  Repository.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

protocol RepositoryProtocol {
	func getCars() -> [Car]
	func saveCars(_ smartObjects: [Car])

}

final class Repository {
	private let dataService: DataServiceProtocol

	init(dataService: DataServiceProtocol) {
		self.dataService = dataService
	}
}

extension Repository: RepositoryProtocol {
	func getCars() -> [Car] {
//		guard let data = dataService.loadData(),
//			let cars = try? PropertyListDecoder().decode([Car].self, from: data) else { return [] }
//		return cars
		return [Car(model: "VAZ", manufacturer: "Avtovaz", manufactureDate: "1982", bodyType: "Sidan")]
	}
	
	func saveCars(_ cars: [Car]) {
		guard let data = try? PropertyListEncoder().encode(cars) else { return }
		dataService.saveData(data)
	}
}
