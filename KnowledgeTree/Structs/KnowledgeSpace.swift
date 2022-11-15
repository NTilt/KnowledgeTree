//
//  KnowledgeSpace.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation

struct KnowledgeSpace {
    
    private(set) var rootSquare: Square
    private(set) var rightUpSector: RightSector
    private(set) var lowerSector: LowerSector
    private(set) var leftSector: LeftSector
    private(set) var upperSector: UpperSector
    private(set) var rootVertex: KnowledgeTreeModel.Vertex
    
    init(root rootVertex: KnowledgeTreeModel.Vertex, _ singleSegment: Int, _ centerLocation: Location) {
        self.rootVertex = rootVertex
        self.rootSquare = Square(singleSegment: singleSegment, center: centerLocation, magnification: getMagnification(count: rootVertex.childList.count))
        self.rightUpSector = RightSector(rootSquare)
        self.lowerSector = LowerSector(rootSquare)
        self.leftSector = LeftSector(rootSquare)
        self.upperSector = UpperSector(rootSquare)
    }
    
    func buildRoot(root rootVertex: KnowledgeTreeModel.Vertex, _ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeTree.changeLocation(rootVertex, rootSquare.centerLocation)
        let queue = rootSquare.getAllSidesCoordinates()
        var ind = 0
        for child in rootVertex.childList {
            if let childVertex = knowledgeTree.getVertexFromIndex(from: child) {
                let location = queue[ind]
                knowledgeTree.changeLocation(childVertex, location)
                ind += 1
                
            }
        }
    }
    
    mutating func buildRightSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        rightUpSector.buildSector(root: rootSquare, &knowledgeTree)
    }
    
    mutating func buildLowerSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        lowerSector.buildSector(root: rootSquare, &knowledgeTree)
    }
    
    mutating func buildLeftSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        leftSector.buildSector(root: rootSquare, &knowledgeTree)
    }
    
    mutating func buildUpperSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        upperSector.buildSector(root: rootSquare, &knowledgeTree)
    }
    
    
}
