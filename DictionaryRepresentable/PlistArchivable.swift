//
//  PlistArchivable.swift
//  Health Up Display
//
//  Created by Victor Hudson on 3/14/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

protocol PlistArchivable: DictionaryRepresentable {
	func saveToDocumentsDirectory(fileName fileName: String) -> Bool
	
	static func restoreFromFile<T: PlistArchivable>(fileName fileName: String) -> T?
}

extension PlistArchivable {
	var fileManager: NSFileManager { return NSFileManager.defaultManager() }
	
	var documentsDirectory: NSURL {
		return fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
	}
	
	func saveToDocumentsDirectory(fileName fileName: String) -> Bool {
		let URL = documentsDirectory.URLByAppendingPathComponent(fileName)
		return self.dictionaryRepresentation().writeToURL(URL, atomically: true)
	}
	
	static func restoreFromFile<T: PlistArchivable>(fileName fileName: String) -> T? {
		var instance = T()
		let URL = instance.documentsDirectory.URLByAppendingPathComponent(fileName)
		guard instance.fileManager.fileExistsAtPath(URL.relativePath!),
			let archiveDictionary = NSDictionary(contentsOfURL: URL)
			where instance.decode(dictionary: archiveDictionary) else {
				print("No file at URL \(URL.relativePath!)")
				return nil
		}
		return instance
	}
}