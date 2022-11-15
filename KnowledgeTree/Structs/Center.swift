//
//  Center.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation


struct Center {
    var x: Float
    var y: Float
    
    init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
    init(coordinates: (x: Float, y: Float)) {
        self.x = coordinates.x
        self.y = coordinates.y
    }
    
    func getCoordinates() -> (x: Float, y: Float) {
        return (self.x, self.y)
    }
}

extension Center: Equatable {
    static func == (lhs: Center, rhs: Center) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
