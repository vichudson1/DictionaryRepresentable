//
//  DictionaryRepresentable.swift
//  
//
//  Created by Victor Hudson on 3/13/16.
//
//

import Foundation

public protocol DictionaryRepresentable {
	/**
	All conforming types will need a parameterless `init()`. The provided default implementation for `init(dictionaryRepresentation: NSDictionary?)` will need it to prepare the instance of your Type to unpack from the Dictionary Representation.
	*/
	init()
	
	/**
	This method must be defined in your conforming Type or in an extension of your Type. This is where you unpack the dictionary back to your Type's members.
	
	- parameter dictionary: `NSDictionary` containing the values for your Types members.
	
	- returns: `Bool` indicating whether you were able to successfully extract and restore your Type's members from the dictionary. Returning false will cause the failable `init(dictionaryRepresentation: NSDictionary?)` to return nil.
	*/
	mutating func decode(dictionary dictionary:NSDictionary) -> Bool

	/**
	This method must be defined in your conforming Type or in an extension of your Type. This is where you pack the values of your conforming Type's members into an `NSDictionary`.
	
	- returns: `NSDictionary` containing the values of all your conforming Type's members.
	*/
	func dictionaryRepresentation() -> NSDictionary
	
	/**
	Failable `init()` for your conforming type. There is a default implementation of this provided in the protocol extension.
	
	- parameter dictionaryRepresentation: `NSDictionary` containing the values for your Types members.
	
	- returns: Nil in the event your `decode(dictionary dictionary:NSDictionary)` returns false, otherwise you'll have a fully restored instance of your conforming Type.
	*/
	init?(dictionaryRepresentation: NSDictionary?)
}

extension DictionaryRepresentable {
	init?(dictionaryRepresentation: NSDictionary?) {
		guard let dictionary = dictionaryRepresentation else { return nil }
		self.init()
		guard decode(dictionary: dictionary) else { return nil }
	}
}
