//
//  CarDetailsViewController.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

protocol CarDetailsViewControllerProtocol: class {
}

class CarDetailsViewController: UIViewController {
	
	private let label = UILabel(frame: .zero)
	private let presenter: CarDitailsPresenterProtocol
	
	init(presenter: CarDitailsPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = .red
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
			label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
			label.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
			label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50),
		])
    }
}

extension CarDetailsViewController: CarDetailsViewControllerProtocol {
	
}
