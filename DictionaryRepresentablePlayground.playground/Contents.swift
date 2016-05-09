//: Playground - noun: a place where people can play

import Foundation

var points = [Point]()
for i in 0...9 {
	points.append(Point(x: 0, y: 1))
}

let line = Line(points: points)

extension Point: DictionaryRepresentable {
	func dictionaryRepresentation() -> NSDictionary {
		return ["x": x, "y": y]
	}
	
	init?(dictionaryRepresentation: NSDictionary?) {
		guard let values = dictionaryRepresentation, x = values["x"], y = values["y"] else { return nil }
		self.x = x as! Int
		self.y = y as! Int
		
	}
}
