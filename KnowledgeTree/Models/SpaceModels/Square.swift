//
//  Square.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation

struct Square {
    
    var singleSegment: Int
    var centerLocation: (x: Float, y: Float)
    var magnification: Int
    var lengthSide: Int
    
    init (singleSegment: Int, center: (x: Float, y: Float), magnification: Int) {
        self.lengthSide = singleSegment * magnification
        self.singleSegment = singleSegment
        self.centerLocation = center
        self.magnification = magnification
    }
    
    init (singleSegment: Int, center: Location, magnification: Int) {
        self.lengthSide = singleSegment * magnification
        self.magnification = magnification
        self.singleSegment = singleSegment
        self.centerLocation = center.getCoordinates()
    }
    
    init (singleSegment: Int, center: Center, magnification: Int) {
        self.lengthSide = singleSegment * magnification
        self.magnification = magnification
        self.singleSegment = singleSegment
        self.centerLocation = center.getCoordinates()
    }
    
    /**
     Returns the top left corner of the square.
     - Returns: Top left corner
     */
    func getLeftUpCorner() -> (x: Float, y: Float) {
        let x = self.centerLocation.x - Float(lengthSide / 2)
        let y = self.centerLocation.y - Float(lengthSide / 2)
        return (x, y)
    }
    
    /**
     Returns the top right corner of the square.
     - Returns: Top right corner
     */
    func getRightUpCorner() -> (x: Float, y: Float) {
        let x = self.centerLocation.x + Float(lengthSide / 2)
        let y = self.centerLocation.y - Float(lengthSide / 2)
        return (x, y)
    }
    
    /**
     Returns the low right corner of the square.
     - Returns: Low right corner
     */
    func getRightLowCorner() -> (x: Float, y: Float) {
        let x = self.centerLocation.x + Float(lengthSide / 2)
        let y = self.centerLocation.y + Float(lengthSide / 2)
        return (x, y)
    }
    
    /**
     Returns the low right corner of the square.
     - Returns: Low right corner
     */
    func getLeftLowCorner() -> (x: Float, y: Float) {
        let x = self.centerLocation.x - Float(lengthSide / 2)
        let y = self.centerLocation.y + Float(lengthSide / 2)
        return (x, y)
    }
    
    /**
     Returns all dots from left side square
     - Returns: All dots from left side square
     */
    func getLeftSideCoordinates() -> [(x: Float, y: Float)] {
        var allCoordinates: [(x:Float, y:Float)] = []
        let x = getLeftUpCorner().x
        let yUp = getLeftUpCorner().y
        let yLow = getLeftLowCorner().y
        for y in stride(from: yLow - Float(self.singleSegment), through: yUp + Float(self.singleSegment), by: -Float(self.singleSegment)) {
            allCoordinates.append((x, y))
        }
        return allCoordinates
    }
    
    /**
     Returns all dots from right side square
     - Returns: All dots from right side square
     */
    func getRightSideCoordinates() -> [(x: Float, y: Float)] {
        var allCoordinates: [(x:Float, y:Float)] = []
        let x = getRightUpCorner().x
        let yUp = getRightUpCorner().y
        let yLow = getRightLowCorner().y
        let k = Float(self.singleSegment)
        for y in stride(from: yUp + k, through: yLow - k, by: k) {
            allCoordinates.append((x, y))
        }
        return allCoordinates
    }
    
    /**
     Return all dots from up side square
     - Returns: All dots from up side square
     */
    func getUpSideCoordinates() -> [(x: Float, y: Float)] {
        var allCoordinates: [(x:Float, y:Float)] = []
        let k = Float(self.singleSegment)
        let y = getLeftUpCorner().y
        let xLeft = getLeftUpCorner().x
        let xRight = getRightUpCorner().x
        for x in stride(from: xLeft + k, through: xRight - k, by: k) {
            allCoordinates.append((x, y))
        }
        return allCoordinates
    }
    
    /**
     Return all dots from low side square
     - Returns: All dots from low side square
     */
    func getLowSideCoordinates() -> [(x: Float, y: Float)] {
        var allCoordinates: [(x:Float, y:Float)] = []
        let k = Float(self.singleSegment)
        let y = getLeftLowCorner().y
        let xLeft = getLeftLowCorner().x
        let xRight = getRightLowCorner().x
        for x in stride(from: xRight - k, through: xLeft + k, by: -k) {
            allCoordinates.append((x, y))
        }
        return allCoordinates
    }
    
    /**
     Return list with all dots from sides square
     - Returns: List with all dots from all sides square.
     */
    func getAllSidesCoordinates() -> [(x: Float, y: Float)] {
        var allCoordinates: [(x: Float, y: Float)] = []
        
        allCoordinates.append(getLeftUpCorner())
        
        for coordinate in getUpSideCoordinates() {
            allCoordinates.append(coordinate)
        }
        
        allCoordinates.append(getRightUpCorner())
        
        for coordinate in getRightSideCoordinates() {
            allCoordinates.append(coordinate)
        }
        
        allCoordinates.append(getRightLowCorner())
        
        for coordinate in getLowSideCoordinates() {
            allCoordinates.append(coordinate)
        }
        
        allCoordinates.append(getLeftLowCorner())
        
        for coordinate in getLeftSideCoordinates() {
            allCoordinates.append(coordinate)
        }
        
        return allCoordinates
    }
}

extension Square: Equatable {
    static func == (lhs: Square, rhs: Square) -> Bool {
        return lhs.centerLocation == rhs.centerLocation
    }
}
