//
//  CarListRouter.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

protocol CarListRouterProtocol {
	func showDetails(_ car: Car)
}

final class CarListRouter {
	
	
}

extension CarListRouter: CarListRouterProtocol {
	func showDetails(_ car: Car) {
		print(#function)
	}
}
