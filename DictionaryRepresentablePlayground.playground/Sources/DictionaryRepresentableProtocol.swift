import Foundation

public protocol DictionaryRepresentable {
	func dictionaryRepresentation() -> NSDictionary
	init?(dictionaryRepresentation:NSDictionary?)
}

public extension CollectionType where Generator.Element: DictionaryRepresentable {
	public func dictionaryRepresentation() -> [NSDictionary] {
		return self.map({ (item:Self.Generator.Element) -> NSDictionary in
			item.dictionaryRepresentation()
		})
	}
}

public extension CollectionType where Generator.Element: NSDictionary {
	public func decodeFromDictionaryRepresentation<T: DictionaryRepresentable>() -> [T] {
		return self.flatMap{T(dictionaryRepresentation:$0)}
	}
}

