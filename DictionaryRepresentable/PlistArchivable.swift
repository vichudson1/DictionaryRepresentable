//
//  PlistArchivable.swift
//  Health Up Display
//
//  Created by Victor Hudson on 3/14/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

protocol PlistArchivable: DictionaryRepresentable {
	func saveToDocumentsDirectory(fileName: String) -> Bool
	
	static func restoreFromFile<T: PlistArchivable>(fileName: String) -> T?
}

extension PlistArchivable {
	var fileManager: FileManager { return FileManager.default }
	
	var documentsDirectory: URL {
		return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
	}
	
	func saveToDocumentsDirectory(fileName: String) -> Bool {
		let URL = documentsDirectory.appendingPathComponent(fileName)
		return self.dictionaryRepresentation().write(to: URL, atomically: true)
	}
	
	static func restoreFromFile<T: PlistArchivable>(fileName: String) -> T? {
		var instance = T()
		let URL = instance.documentsDirectory.appendingPathComponent(fileName)
		guard instance.fileManager.fileExists(atPath: URL.relativePath),
			let archiveDictionary = NSDictionary(contentsOf: URL)
			, instance.decode(dictionary: archiveDictionary) else {
				print("No file at URL \(URL.relativePath)")
				return nil
		}
		return instance
	}
}
