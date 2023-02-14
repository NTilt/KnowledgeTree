//
//  Location.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation

struct Location {
    var x: Float
    var y: Float
    var availability: Bool
    
    init(x: Float, y: Float, availability: Bool) {
        self.x = x
        self.y = y
        self.availability = availability
    }
    
    init(coordinates: (x: Float, y: Float)) {
        self.x = coordinates.x
        self.y = coordinates.y
        self.availability = true
    }
    
    init(coordinates: (x: Float, y: Float), availability: Bool) {
        self.x = coordinates.x
        self.y = coordinates.y
        self.availability = availability
    }

    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
        self.availability = true
    }
    
    func getCoordinates() -> (x: Float, y: Float) {
        (self.x, self.y)
    }
    
    mutating func available() {
        self.availability = false
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
