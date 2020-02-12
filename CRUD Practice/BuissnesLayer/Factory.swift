//
//  Factory.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

enum Factory {
	
	static func createCarListModule() -> CarListViewController {
		let router = CarListRouter()
		let dataService = DataService()
		let repository = Repository(dataService: dataService)
		let presenter = CarListPresenter(router: router, repository: repository)
		let viewController = CarListViewController(presenter: presenter)
		presenter.viewController = viewController
		router.carViewController = viewController
		return viewController
	}
	
	static func createDetailsCarModule(car: Car?) -> CarDetailsViewController {
		let presenter = CarDitailsPresenter(car: car)
		let viewController = CarDetailsViewController(presenter: presenter)
		presenter.viewController = viewController
		return viewController
	}
}
