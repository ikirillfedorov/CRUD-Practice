//
//  DataService.swift
//  CRUD Practice
//
//  Created by Kirill Fedorov on 10.02.2020.
//  Copyright © 2020 Kirill Fedorov. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
	func saveData(_ data: Data)
	func loadData() -> Data?

}

final class DataService {
//	var isDir: ObjCBool = false
//	if FileManager.default.fileExists(atPath: dirurl.path, isDirectory: &isDir), isDir.boolValue {
//	try? FileManager.default.createDirectory(at: dirurl, withIntermediateDirectories: true, attributes: nil)
//	}
	
	
	private let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
	
	private var archiveURL: URL {
		return documentDirectory?.appendingPathComponent("data").appendingPathExtension("plist") ??
		documentDirectory.unsafelyUnwrapped
	}
	
}

extension DataService: DataServiceProtocol
{
	func saveData(_ data: Data) {
		do {
			try data.write(to: archiveURL, options: .noFileProtection)
		} catch {
			print(error.localizedDescription)
		}
	}

	func loadData() -> Data? {
		do {
			return try Data(contentsOf: archiveURL)
		} catch {
			print(error.localizedDescription)
			return nil
		}
	}
}
