//
//  CarDetailsViewController.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

protocol CarDetailsViewControllerProtocol: class {
	func saveButtonPressed()
}

class CarDetailsViewController: UIViewController {
	
	private let label = PropertyField()
	private let presenter: CarDitailsPresenterProtocol
	private let detailsView = CarDitailsView()
	
	init(presenter: CarDitailsPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = detailsView
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .white
		setupNavigationBar()
		checkCurrentCar()
    }
	
	private func checkCurrentCar() {
		guard let car = presenter.getCurrentCar() else { return }
		detailsView.modelField.textField.text = car.model
		detailsView.manufacturerField.textField.text = car.manufacturer
		detailsView.manufactureDateField.textField.text = detailsView.formatter.string(from: car.manufactureDate)
	}
	
	private func setupNavigationBar() {
		navigationItem.title = presenter.getCurrentCar()?.model ?? "Add new car"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
	}
	
}

extension CarDetailsViewController: CarDetailsViewControllerProtocol {
	@objc func saveButtonPressed() {
		let car = Car(model: detailsView.modelField.textField.text ?? "",
					  manufacturer: detailsView.manufacturerField.textField.text ?? "",
					  manufactureDate: detailsView.formatter.date(from: detailsView.manufactureDateField.textField.text ?? "") ?? Date(),
					  bodyType: "Test",
					  id: presenter.getCurrentCar()?.id)
		presenter.updateOrAddCar(car)
		navigationController?.popViewController(animated: true)
	}
}
