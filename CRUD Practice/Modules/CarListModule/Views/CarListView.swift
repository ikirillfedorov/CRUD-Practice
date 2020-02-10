//
//  CarListView.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

final class CarListView: UIView {
	
	let carTableView = UITableView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .white
		carTableView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(carTableView)
		setConstraint()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setConstraint() {
		NSLayoutConstraint.activate([
			carTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			carTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			carTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			carTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}
