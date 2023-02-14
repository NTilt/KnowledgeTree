//
//  UpperSector.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation

struct UpperSector {
    private(set) var centers = [Center]()
    private(set) var squares = [Square]()
    private(set) var levelsWithDots = [Int]()
    private(set) var dots = [([Location], Int)]()
    var currentLevel: Int = 0
    
    init(_ rootSquare: Square) {
        self.squares.append(rootSquare)
        levelsWithDots.append(currentLevel)
        var lowerSideDots: [(x: Float, y: Float)] = []
        lowerSideDots.append(rootSquare.getLeftUpCorner())
        lowerSideDots.append(contentsOf: rootSquare.getUpSideCoordinates())
        var lowerLocations: [Location] = []
        for dot in lowerSideDots {
            lowerLocations.append(Location(coordinates: dot, availability: false))
        }
        dots.append((lowerLocations, currentLevel))
    }
    
    /**
     The function returns the centers of the squares for the input level.
     - Parameters:
        - level: Input level
     - Returns: Array with coordinates centers.
     */
    func getCentersFromLevel(lvl level: Int) -> [Center] {
        var outputCenters: [Center] = []
        if let rootSquare = squares.first {
            let lengthSide = Float(rootSquare.lengthSide)
            let centerX = rootSquare.centerLocation.x
            let centerY = rootSquare.centerLocation.y
            let rightTopSquareCenter: (x: Float, y: Float) = (x: centerX, y: (centerY - lengthSide) - Float(level) * lengthSide)
            let leftBotSquareCenter: (x: Float, y: Float) = (x: centerX - Float(level) * lengthSide, y: centerY - lengthSide)
            var currentCenter: (x: Float, y: Float) = (x: leftBotSquareCenter.x, y: leftBotSquareCenter.y)
            for y in stride(from: currentCenter.y, through: rightTopSquareCenter.y, by: -lengthSide) {
                currentCenter = (x: currentCenter.x, y: y)
                outputCenters.append(Center(coordinates: currentCenter))
            }
            for x in stride(from: currentCenter.x + lengthSide, through: rightTopSquareCenter.x, by: lengthSide) {
                currentCenter = (x: x, y: currentCenter.y)
                outputCenters.append(Center(coordinates: currentCenter))
            }
            
            
        }
        return outputCenters
    }
    
    func getAllFreeDots(from centers: [Center]) -> [Location] {
        
        var minY = centers[0].y
        var maxY = centers[0].y
        var minX = centers[0].x
        var maxX = centers[0].x
        for center in centers {
            if let square = getSquareFromCenter(from: center) {
                if square.centerLocation.y - Float(square.lengthSide / 2) < minY {
                    minY = square.centerLocation.y - Float(square.lengthSide / 2)
                }
                if square.centerLocation.x - Float(square.lengthSide / 2) < minX {
                    minX = square.centerLocation.x - Float(square.lengthSide / 2)
                }
                
                if square.centerLocation.y + Float(square.lengthSide / 2) > maxY {
                    maxY = square.centerLocation.y + Float(square.lengthSide / 2)
                }
                
                if square.centerLocation.x + Float(square.lengthSide / 2) > maxX {
                    maxX = square.centerLocation.x + Float(square.lengthSide / 2)
                }
            }
        }
        var allFreeDots: [(x: Float, y: Float)] = []
        for center in centers {
            if let square = getSquareFromCenter(from: center) {
                if square.getLeftUpCorner().x == minX {
                    allFreeDots.append(contentsOf: square.getLeftSideCoordinates())
                    allFreeDots.append(square.getLeftUpCorner())
                }
            }
        }
        for center in centers {
            if let square = getSquareFromCenter(from: center) {
                if square.getLeftUpCorner().y == minY {
                    allFreeDots.append(square.getLeftUpCorner())
                    allFreeDots.append(contentsOf: square.getUpSideCoordinates())
                    
                }
            }
        }
        var freeDotsLocation: [Location] = []
        for dot in allFreeDots {
            if !freeDotsLocation.contains(where: {
                if $0.getCoordinates() == dot {return true}
                else {return false}
            }) {
                freeDotsLocation.append(Location(coordinates: dot))
            }
            
        }
        return freeDotsLocation
    }
    
    mutating func buildSector(root rootSquare: Square, _ knowledgeTree: inout KnowledgeTreeModel) {
        let currentDots = getAllDotsFromLevel(lvl: currentLevel)
        var generalCountChilds = 0
        for dot in currentDots {
            if let vertex = knowledgeTree.getVertexFromLocation(from: dot) {
                generalCountChilds += vertex.childList.count
            }
        }
        if generalCountChilds > 0 {
            let newLevel = getLevel(count: generalCountChilds, rootSquare.magnification)
            currentLevel += newLevel
            let newCenters = getCentersFromLevel(lvl: currentLevel)
            for center in newCenters {
                addSquare(rootSquare.singleSegment, center, rootSquare.magnification)
            }
            var freeDots = getAllFreeDots(from: newCenters)
            var ind = 0
            for dot in currentDots {
                if let parentVertex = knowledgeTree.getVertexFromLocation(from: dot) {
                    for childIndex in parentVertex.childList {
                        if let childVertex = knowledgeTree.getVertexFromIndex(from: childIndex) {
                            if freeDots[ind].availability {
                                knowledgeTree.changeLocation(childVertex, freeDots[ind].getCoordinates())
                                freeDots[ind].availability = false
                                ind += 1
                            }
                            
                        }
                    }
                }
            }
            dots.append((freeDots, currentLevel))
            buildSector(root: rootSquare, &knowledgeTree)
        }
    }
    
    /**
     The function returns all the coordinates of the points that are at the input level.
     - Parameters:
        - level: Input level.
     - Returns: Array with coordinates dots.
     */
    func getAllDotsFromLevel(lvl level: Int) -> [Location] {
        for (locations, lvl) in dots {
            if lvl == level {
                return locations
            }
        }
        return []
    }
    
    /**
     Creates a square with the input parameters. Adds a square and its center to the general arrays.
     - Parameters:
        - singleSegment: Unit side length of a square
        - centerLocation: Square center coordinates
        - magnification: Square length factor
    */
    mutating func addSquare(_ singleSegment: Int, _ centerLocation: Center, _ magnification: Int) {
        let square = Square(singleSegment: singleSegment, center: centerLocation, magnification: magnification)
        if !squares.contains(where: {
            if $0 == square {return true}
            else {return false}
        }) {
            squares.append(square)
            centers.append(centerLocation)
        }
    }
    
    /**
     Function return Square from input center.
     - Parameters:
        - center: Input center.
     - Returns: Square if found else nil.
     */
    func getSquareFromCenter(from center: Center) -> Square? {
        for square in squares {
            if square.centerLocation == center.getCoordinates() {
                return square
            }
        }
        return nil
    }
}


