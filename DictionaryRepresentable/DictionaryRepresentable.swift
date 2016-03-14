//
//  DictionaryRepresentable.swift
//  
//
//  Created by Victor Hudson on 3/13/16.
//
//

import Foundation

public protocol DictionaryRepresentable {
	func dictionaryRepresentation() -> NSDictionary
	init?(dictionaryRepresentation:NSDictionary?)
}

