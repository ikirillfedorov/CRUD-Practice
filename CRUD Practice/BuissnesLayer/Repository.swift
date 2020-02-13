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
		guard let data = dataService.loadData() else { return [] }
		do {
			let cars = try PropertyListDecoder().decode([Car].self, from: data)
			return cars
		} catch {
			print(error.localizedDescription)
		}
		return []
	}
	
	func saveCars(_ cars: [Car]) {
		do {
			let data = try PropertyListEncoder().encode(cars)
			dataService.saveData(data)
		} catch {
			print(error.localizedDescription)
		}
	}
}
