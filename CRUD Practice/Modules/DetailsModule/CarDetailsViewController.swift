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
	private var saveBarButton = UIBarButtonItem()
	
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
		detailsView.modelField.textField.delegate = self
		detailsView.manufacturerField.textField.delegate = self
		detailsView.manufactureDateField.textField.delegate = self
		detailsView.bodyTypeField.textField.delegate = self

		setupNavigationBar()
		checkCurrentCar()
		addTargets()
    }
	
	@objc
	private func textFieldEditingChanged(sender: UITextField) {
		guard
			let textFromModelField = detailsView.modelField.textField.text,
			let textFromManufacturerField = detailsView.manufacturerField.textField.text,
			let textFromManufactureDateField = detailsView.manufactureDateField.textField.text,
			let textFromBodyTypeField = detailsView.bodyTypeField.textField.text
		else { return }
		saveBarButton.isEnabled = !textFromModelField.isEmpty
			&& !textFromManufacturerField.isEmpty
			&& !textFromManufactureDateField.isEmpty
			&& !textFromBodyTypeField.isEmpty
	}
	
	private func addTargets() {
		detailsView.modelField.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
		detailsView.manufacturerField.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
		detailsView.manufactureDateField.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .allEditingEvents)
		detailsView.bodyTypeField.textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .allEditingEvents)
	}
	
	private func checkCurrentCar() {
		guard let car = presenter.getCurrentCar() else { return }
		detailsView.modelField.textField.text = car.model
		detailsView.manufacturerField.textField.text = car.manufacturer
		detailsView.manufactureDateField.textField.text = detailsView.formatter.string(from: car.manufactureDate)
		detailsView.bodyTypeField.textField.text = car.bodyType

	}
	
	private func setupNavigationBar() {
		saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
		navigationItem.title = presenter.getCurrentCar()?.model ?? "Add new car"
		navigationItem.rightBarButtonItem = saveBarButton
		saveBarButton.isEnabled = (presenter.getCurrentCar() != nil)
	}
}

extension CarDetailsViewController: CarDetailsViewControllerProtocol {
	@objc func saveButtonPressed() {
		let car = Car(model: detailsView.modelField.textField.text ?? "",
					  manufacturer: detailsView.manufacturerField.textField.text ?? "",
					  manufactureDate: detailsView.formatter.date(from: detailsView.manufactureDateField.textField.text ?? "") ?? Date(),
					  bodyType: detailsView.bodyTypeField.textField.text ?? "",
					  id: presenter.getCurrentCar()?.id)
		presenter.updateOrAddCar(car)
		navigationController?.popViewController(animated: true)
	}
}

extension CarDetailsViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return textField.resignFirstResponder()
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		switch textField.tag {
		case TextFieldType.bodyTypeField.rawValue, TextFieldType.manufactureDateField.rawValue:
			return false
		default:
			return true
		}
	}
}
