//
//  CarDitailsPresenter.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

protocol CarDitailsPresenterProtocol {
	func getCurrentCar() -> Car?
	func updateOrAddCar(_ car: Car)
}

final class CarDitailsPresenter {
	
	weak var viewController: CarDetailsViewControllerProtocol?
	private let repository: RepositoryProtocol
	private let car: Car?
	
	
	init(repository: RepositoryProtocol, car: Car?) {
		self.repository = repository
		self.car = car
	}
}

extension CarDitailsPresenter: CarDitailsPresenterProtocol {
	func updateOrAddCar(_ car: Car) {
		let filtredCars = repository.getCars().filter { $0.id != car.id } + [car]
		repository.saveCars(filtredCars)
	}
	
	func getCurrentCar() -> Car? {
		return car
	}
}
