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
		let presenter = CarListPresenter(router: router)
		let viewController = CarListViewController(presenter: presenter)
		viewController.presenter = presenter
		return viewController
	}
}
