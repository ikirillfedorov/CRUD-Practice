//
//  Factory.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

final class Factory {
	
	let repository = Repository(dataService: DataService())
	
	func createCarListModule() -> CarListViewController {
		let router = CarListRouter()
		let presenter = CarListPresenter(router: router, repository: repository)
		let viewController = CarListViewController(presenter: presenter)
		presenter.viewController = viewController
		router.carViewController = viewController
		return viewController
	}
	
	func createDetailsCarModule(car: Car?) -> CarDetailsViewController {
		let presenter = CarDitailsPresenter(repository: repository, car: car)
		let viewController = CarDetailsViewController(presenter: presenter)
		presenter.viewController = viewController
		return viewController
	}
}
