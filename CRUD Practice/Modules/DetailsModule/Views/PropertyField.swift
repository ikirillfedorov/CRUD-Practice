//
//  PropertyField.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 11.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

final class PropertyField: UIView {
	
	let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
		return label
	}()
	
	let textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.borderStyle = .roundedRect
		textField.autocorrectionType = .no
		textField.clearButtonMode = .whileEditing
		return textField
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(label)
		self.addSubview(textField)
		setConstraint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setConstraint() {
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: self.topAnchor),
			label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			label.heightAnchor.constraint(equalToConstant: 21),
			
			textField.topAnchor.constraint(equalTo: label.bottomAnchor),
			textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			textField.heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
		])
	}

}
