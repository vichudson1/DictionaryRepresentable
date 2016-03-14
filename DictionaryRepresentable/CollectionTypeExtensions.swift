//
//  CollectionTypeExtensions.swift
//  Health Up Display
//
//  Created by Victor Hudson on 3/14/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

public extension CollectionType where Generator.Element: DictionaryRepresentable {
	func dictionaryRepresentation() -> [NSDictionary] {
		return self.map({ (item:Self.Generator.Element) -> NSDictionary in
			item.dictionaryRepresentation()
		})
	}
}

public extension CollectionType where Generator.Element: NSDictionary {
	func restoreItemsFromDictionaryRepresentation<T: DictionaryRepresentable>() -> [T] {
		return self.flatMap{T(dictionaryRepresentation:$0)}
	}
}