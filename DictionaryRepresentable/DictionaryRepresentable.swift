//
//  DictionaryRepresentable.swift
//  
//
//  Created by Victor Hudson on 3/13/16.
//
//

import Foundation

public protocol DictionaryRepresentable {
	init()
	mutating func decode(dictionary dictionary:NSDictionary) -> Bool

	
	init?(dictionaryRepresentation: NSDictionary?)
	func dictionaryRepresentation() -> NSDictionary
}

extension DictionaryRepresentable {
	init?(dictionaryRepresentation: NSDictionary?) {
		guard let dictionary = dictionaryRepresentation else { return nil }
		self.init()
		guard decode(dictionary: dictionary) else { return nil }
	}
}
