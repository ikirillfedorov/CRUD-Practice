//
//  CarViewController.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

protocol CarListViewControllerProtocol: class {
	func updateTableView()
}

final class CarListViewController: UIViewController {
	
	var presenter: CarListPresenterProtocol
	
	init(presenter: CarListPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension CarListViewController: CarListViewControllerProtocol {
	func updateTableView() {
		print(#function)
	}
}
