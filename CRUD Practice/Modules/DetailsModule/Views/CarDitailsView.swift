//
//  CarDitailsView.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 11.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

final class CarDitailsView: UIView {

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
		field.backgroundColor = .yellow
		return field
	}()
	
	let manufacturer: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Manufacturer"
		return field
	}()

	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		setConstraint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addSubviews() {
		self.addSubview(imageView)
		self.addSubview(modelField)
		self.addSubview(manufacturer)

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

			manufacturer.topAnchor.constraint(equalTo: modelField.bottomAnchor, constant: 8),
			manufacturer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			manufacturer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			manufacturer.heightAnchor.constraint(equalToConstant: 65),


		])
	}

}
