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
//		addGestures()
		checkCurrentCar()
    }
	
//	private func addGestures() {
//		detailsView.manufactureYearLabel.addGestureRecognizer(setGesture())
//		detailsView.bodyTypeLabel.addGestureRecognizer(setGesture())
//	}
	
	private func checkCurrentCar() {
		guard let car = presenter.getCurrentCar() else { return }
		detailsView.modelField.textField.text = car.model
		detailsView.manufacturerField.textField.text = car.manufacturer
//		detailsView.bodyTypeLabel.text = car.bodyType
//		detailsView.manufactureYearLabel.text = car.manufactureYear
	}
	
	private func setupNavigationBar() {
		navigationItem.title = presenter.getCurrentCar()?.model ?? "Add new car"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonPressed))
	}
	
	private func setGesture() -> UITapGestureRecognizer {
		 return UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
	}
	
	@objc private func saveButtonPressed() {
		print(#function)
	}

	@objc func handleTap(sender: UITapGestureRecognizer) {
		
		
	}
}

extension CarDetailsViewController: CarDetailsViewControllerProtocol {
	
}
