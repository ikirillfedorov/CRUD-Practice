//
//  CarListPresenter.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

protocol CarListPresenterProtocol {
	func getCarsCount() -> Int
	func getCar(index: Int) -> Car
	func removeCar(at index: Int)
	func showDetailsCar(at index: Int?)
}

final class CarListPresenter {
	
	weak var viewController: CarListViewControllerProtocol?
	private let repository: RepositoryProtocol
	private let router: CarListRouterProtocol
	private var cars: [Car] {
		get { repository.getCars() }
		set { repository.saveCars(newValue) }
	}
	
	init(router: CarListRouterProtocol, repository: RepositoryProtocol) {
		self.router = router
		self.repository = repository
	}
}

extension CarListPresenter: CarListPresenterProtocol {
	
	func showDetailsCar(at index: Int?) {
		if let index = index {
			router.showDetails(cars[index])
		} else{
			router.showDetails(nil)
		}
	}
	
	func removeCar(at index: Int) {
//		let removedCar = cars.first { $0.id == cars[index].id }
//		guard let car = removedCar else { return }
		cars.remove(at: index)
	}
	
	func getCarsCount() -> Int {
		return cars.count
	}
	
	func getCar(index: Int) -> Car {
		return cars[index]
	}
}
