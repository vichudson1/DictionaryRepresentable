//
//  CollectionTypeExtensions.swift
//  Health Up Display
//
//  Created by Victor Hudson on 3/14/16.
//  Copyright © 2016 Victor Hudson. All rights reserved.
//

import Foundation

public extension Collection where Iterator.Element: DictionaryRepresentable {
	func dictionaryRepresentation() -> [NSDictionary] {
		return self.map{ $0.dictionaryRepresentation() }
	}
}

public extension Collection where Iterator.Element: NSDictionary {
	func restoreItemsFromDictionaryRepresentation<T: DictionaryRepresentable>() -> [T] {
		return self.compactMap{ T(dictionaryRepresentation:$0) }
	}
}
