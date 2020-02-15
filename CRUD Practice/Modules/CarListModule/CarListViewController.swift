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
	
	private let carListView = CarListView()
	private let presenter: CarListPresenterProtocol
	
	init(presenter: CarListPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = carListView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		carListView.carTableView.delegate = self
		carListView.carTableView.dataSource = self
		setupNavigationBar()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		carListView.carTableView.reloadData()
	}
	
	@objc private func addButtonTapped() {
		presenter.showDetailsCar(at: nil)
	}
	
	private func setupNavigationBar() {
		navigationItem.title = "Car list"
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
	}
}

extension CarListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter.getCarsCount()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
		let car = presenter.getCar(index: indexPath.row)
		cell.textLabel?.text = car.model
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			tableView.beginUpdates()
			presenter.removeCar(at: indexPath.row)
			carListView.carTableView.deleteRows(at: [indexPath], with: .automatic)
			tableView.reloadData()
			tableView.endUpdates()
		}
	}
}

extension CarListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		presenter.showDetailsCar(at: indexPath.row)
	}
}

extension CarListViewController: CarListViewControllerProtocol {
	func updateTableView() {
		print(#function)
	}
}


extension CarListViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		return textField.resignFirstResponder()
	}
}
