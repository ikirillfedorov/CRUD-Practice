//
//  CarDitailsPresenter.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

protocol CarDitailsPresenterProtocol {
	
}

final class CarDitailsPresenter {
	
	weak var viewController: CarDetailsViewControllerProtocol?
	let car: Car
	
	
	init(car: Car) {
		self.car = car
	}
}

extension CarDitailsPresenter: CarDitailsPresenterProtocol {
	
}
