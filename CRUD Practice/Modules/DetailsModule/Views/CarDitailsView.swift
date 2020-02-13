//
//  CarDitailsView.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 11.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

final class CarDitailsView: UIView {
	
	enum BodyTypes: String
	{
		case sedan = "Sedan"
		case hatchback = "Hatchback"
		case crossover = "Crossover"
		case coupe = "Coupe"
		case cabriolet = "Cabriolet"
	}

	var pickerDataArray: [String] {
		return [
			BodyTypes.sedan.rawValue,
			BodyTypes.hatchback.rawValue,
			BodyTypes.crossover.rawValue,
			BodyTypes.coupe.rawValue,
			BodyTypes.cabriolet.rawValue,
		]
	}

	
	let formatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM d, yyyy"
		return formatter
	}()
	
	let datePicker: UIDatePicker = {
		let picker = UIDatePicker()
		picker.datePickerMode = .date
		if let localeString = Locale.preferredLanguages.first {
			picker.locale = Locale(identifier: localeString)
		}
		return picker
	}()
	
	let bodyTypePicker: UIPickerView = {
		let picker = UIPickerView()
		return picker
	}()


	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.backgroundColor = .lightGray
		return imageView
	}()
	
	let modelField: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Model"
		return field
	}()
	
	let manufacturerField: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Manufacturer"
		return field
	}()
	
	let manufactureDateField: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Manufacture year"
		return field
	}()
	
	let bodyTypeField: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Car body type"
		return field
	}()


//	let manufactureYearLabel: UILabel = {
//		let label = UILabel()
//		label.translatesAutoresizingMaskIntoConstraints = false
//		label.layer.cornerRadius = 10
//		label.clipsToBounds = true
//		label.isUserInteractionEnabled = true
//		label.text = "Chose year of manufacture"
//		label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
//		label.textAlignment = .center
//		label.textColor = .white
//		label.backgroundColor = UIColor(red: 79 / 255, green: 156 / 255, blue: 224 / 255, alpha: 1)
//		return label
//	}()
//
//	let bodyTypeLabel: UILabel = {
//		let label = UILabel()
//		label.translatesAutoresizingMaskIntoConstraints = false
//		label.layer.cornerRadius = 10
//		label.clipsToBounds = true
//		label.isUserInteractionEnabled = true
//		label.text = "Chose body type"
//		label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
//		label.textColor = .white
//		label.textAlignment = .center
//		label.backgroundColor = UIColor(red: 79 / 255, green: 156 / 255, blue: 224 / 255, alpha: 1)
//		return label
//	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		manufactureDateField.textField.inputView = datePicker
		bodyTypeField.textField.inputView = bodyTypePicker
		addSubviews()
		setConstraint()
		setupDatePicker()
		setupBodyTypePicker()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews() {
		self.addSubview(imageView)
		self.addSubview(modelField)
		self.addSubview(manufacturerField)
		self.addSubview(manufactureDateField)
		self.addSubview(bodyTypeField)
	}
	
	private func setupDatePicker() {
		let toolBar = UIToolbar(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: 44))
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toolBarPressed))
		let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolBar.setItems([flexSpace, doneButton], animated: true)
		manufactureDateField.textField.inputAccessoryView = toolBar
		datePicker.addTarget(self, action: #selector(setDateFromPicker), for: .valueChanged)
	}
	
	private func setupBodyTypePicker() {
		let toolBar = UIToolbar(frame: CGRect(x: .zero, y: .zero, width: UIScreen.main.bounds.width, height: 44))
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(bodyTypePickerToolBarButtonPressed))
		let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolBar.setItems([flexSpace, doneButton], animated: true)
		bodyTypeField.textField.inputAccessoryView = toolBar
		bodyTypePicker.dataSource = self
		bodyTypePicker.delegate = self
	}

	@objc private func toolBarPressed() {
		setDateFromPicker()
		superview?.endEditing(true)
	}
	
	@objc private func bodyTypePickerToolBarButtonPressed() {
		let selectedValue = pickerDataArray[bodyTypePicker.selectedRow(inComponent: 0)]
		bodyTypeField.textField.text = selectedValue
		superview?.endEditing(true)
	}

	
	@objc private func setDateFromPicker() {
		manufactureDateField.textField.text = formatter.string(from: datePicker.date)
	}
	
	private func setConstraint() {
		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
			imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
			imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
			imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1 / 3),

			modelField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
			modelField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			modelField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			modelField.heightAnchor.constraint(equalToConstant: 65),

			manufacturerField.topAnchor.constraint(equalTo: modelField.bottomAnchor, constant: 8),
			manufacturerField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			manufacturerField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			manufacturerField.heightAnchor.constraint(equalToConstant: 65),

			manufactureDateField.topAnchor.constraint(equalTo: manufacturerField.bottomAnchor, constant: 8),
			manufactureDateField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			manufactureDateField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			manufactureDateField.heightAnchor.constraint(equalToConstant: 65),

			bodyTypeField.topAnchor.constraint(equalTo: manufactureDateField.bottomAnchor, constant: 8),
			bodyTypeField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			bodyTypeField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			bodyTypeField.heightAnchor.constraint(equalToConstant: 65),
		])
	}
}

extension CarDitailsView: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerDataArray.count
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		bodyTypeField.textField.text = pickerDataArray[row]
	}

	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerDataArray[row]
	}
	
	
}
