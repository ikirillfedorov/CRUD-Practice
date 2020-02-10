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
}

final class CarListPresenter {
	
	weak var viewController: CarListViewControllerProtocol?
	let router: CarListRouterProtocol
	
	init(router: CarListRouterProtocol) {
		self.router = router
	}
}

extension CarListPresenter: CarListPresenterProtocol {
	func getCarsCount() -> Int {
		print(#function)
		return 0
	}
	
	func getCar(index: Int) -> Car {
		print(#function)
		return Car(model: "", manufactureYear: "", bodyType: "")
	}
	
	
}
