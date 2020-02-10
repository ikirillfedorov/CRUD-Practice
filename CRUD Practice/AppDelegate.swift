//
//  AppDelegate.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let vc = UIViewController(nibName: nil, bundle: nil)
		vc.view.backgroundColor = .blue
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = vc
		window?.makeKeyAndVisible()
		return true
	}
}

