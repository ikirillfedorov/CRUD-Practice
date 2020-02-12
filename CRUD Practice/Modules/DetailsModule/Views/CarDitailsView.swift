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
		return field
	}()
	
	let manufacturerField: PropertyField = {
		let field = PropertyField()
		field.translatesAutoresizingMaskIntoConstraints = false
		field.label.text = "Manufacturer"
		return field
	}()
	
	let manufactureYearLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.layer.cornerRadius = 10
		label.clipsToBounds = true
		label.isUserInteractionEnabled = true
		label.text = "Chose year of manufacture"
		label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
		label.textAlignment = .center
		label.textColor = .white
		label.backgroundColor = UIColor(red: 79 / 255, green: 156 / 255, blue: 224 / 255, alpha: 1)
		return label
	}()
	
	let bodyTypeLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.layer.cornerRadius = 10
		label.clipsToBounds = true
		label.isUserInteractionEnabled = true
		label.text = "Chose body type"
		label.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
		label.textColor = .white
		label.textAlignment = .center
		label.backgroundColor = UIColor(red: 79 / 255, green: 156 / 255, blue: 224 / 255, alpha: 1)
		return label
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
		self.addSubview(manufacturerField)
		self.addSubview(manufactureYearLabel)
		self.addSubview(bodyTypeLabel)
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

			manufactureYearLabel.topAnchor.constraint(equalTo: manufacturerField.bottomAnchor, constant: 8),
			manufactureYearLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			manufactureYearLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			manufactureYearLabel.heightAnchor.constraint(equalToConstant: 44),

			bodyTypeLabel.topAnchor.constraint(equalTo: manufactureYearLabel.bottomAnchor, constant: 8),
			bodyTypeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
			bodyTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
			bodyTypeLabel.heightAnchor.constraint(equalToConstant: 44),
		])
	}

}
