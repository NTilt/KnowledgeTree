//
//  KnowledgeTreeDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation

class KnowledgeTreeDocument: ObservableObject {
    
    @Published private(set) var knowledgeTree: KnowledgeTreeModel
    
    @Published private(set) var knowledgeSpace: KnowledgeSpace
    
    
    init() {
        knowledgeTree = KnowledgeTreeModel()
        let rootVertex = KnowledgeTreeModel.Vertex(isLocked: true, isDraw: true, size: 5, text: "Структуры и алгоритмы", id: 0, childList: [1, 2, 3, 4, 5, 6, 7, 8, 9])
        knowledgeSpace = KnowledgeSpace(root: rootVertex, 370, Location(coordinates: (0, 0)))
        knowledgeTree.addVertex(vertex: rootVertex)
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Программирование на С++", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test2", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test3", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test4", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test5", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test6", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test7", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test8", [])
        knowledgeTree.addVertex(lock: true, draw: false, 5, "Test9", [])
        
        knowledgeTree.linkAll()
        buildRootSquare(root: rootVertex, &knowledgeTree)
        buildRightSector(&knowledgeTree)
        buildLowerSector(&knowledgeTree)
        buildLeftSector(&knowledgeTree)
        buildUpperSector(&knowledgeTree)
    }
    
    init(_ model: KnowledgeTreeModel) {
        knowledgeTree = model
        let rootVertex = model.vertexes[0]
        knowledgeSpace = KnowledgeSpace(root: rootVertex, 370, Location(x: 0, y: 0))
        knowledgeTree.linkAll()
        buildRootSquare(root: rootVertex, &knowledgeTree)
        buildRightSector(&knowledgeTree)
        buildLowerSector(&knowledgeTree)
        buildLeftSector(&knowledgeTree)
        buildUpperSector(&knowledgeTree)
    }
    
    var vertexes: [KnowledgeTreeModel.Vertex] {knowledgeTree.vertexes}
    
    func addVertex(_ isLocked: Bool, _ isDraw: Bool, at location: (Float, Float),
                   _ size: Int, _ text: String, _ childList: [Int]) {
        knowledgeTree.addVertex(lock: isLocked, draw: isDraw, at: location, size, text, childList)
    }
    
    func linkAll() {
        knowledgeTree.linkAll()
    }
    
    func action(_ vertex: KnowledgeTreeModel.Vertex) {
        if vertex.isLocked {
            knowledgeTree.learn(vertex)
            DisplayChildVertexes(vertex)
        }
        else if !vertex.isLocked {
            knowledgeTree.unLearn(vertex)
            HideChildVertexes(vertex)
        }
    }
    
    func learn(_ vertex: KnowledgeTreeModel.Vertex) {
        knowledgeTree.learn(vertex)
    }
    
    func unLearn(_ vertex: KnowledgeTreeModel.Vertex) {
        knowledgeTree.unLearn(vertex)
    }
    
    func draw(_ vertex: KnowledgeTreeModel.Vertex) {
        knowledgeTree.draw(vertex)
    }
    
    func unDraw(_ vertex: KnowledgeTreeModel.Vertex) {
        knowledgeTree.unDraw(vertex)
    }
    
    func getVertexFromIndex(from index: Int) -> KnowledgeTreeModel.Vertex? {
        knowledgeTree.getVertexFromIndex(from: index)
    }
    
    func checkLearnedParents(of vertex: KnowledgeTreeModel.Vertex) -> Bool {
        knowledgeTree.checkLearnedParents(of: vertex)
    }
    
    func DisplayChildVertexes(_ vertex: KnowledgeTreeModel.Vertex) {
        for ind in vertex.childList {
            let newVertex = getVertexFromIndex(from: ind)
            if checkLearnedParents(of: newVertex!) {
                draw(newVertex!)
            }
        }
    }
    
    func HideChildVertexes(_ vertex: KnowledgeTreeModel.Vertex) {
        for ind in vertex.childList {
            let newVertex = getVertexFromIndex(from: ind)
            unDraw(newVertex!)
            unLearn(newVertex!)
            HideChildVertexes(newVertex!)
        }
    }
    
    func changeLocation(_ vertex: KnowledgeTreeModel.Vertex, _ location: (x: Float, y: Float)) {
        knowledgeTree.changeLocation(vertex, location)
    }
    
    /**
     Function for building the initial (root) square with input parameters.
     
     - Parameters:
        - rootVertex:  Initial (root) vertex
        - singleSegment: Unit side length of a square.
     */
    func buildRootSquare(root rootVertex: KnowledgeTreeModel.Vertex, _ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeSpace.buildRoot(root: rootVertex, &knowledgeTree)
    }
    
    func buildRightSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeSpace.buildRightSector(&knowledgeTree)
    }
    
    func buildLowerSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeSpace.buildLowerSector(&knowledgeTree)
    }
    
    func buildLeftSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeSpace.buildLeftSector(&knowledgeTree)
    }
    
    func buildUpperSector(_ knowledgeTree: inout KnowledgeTreeModel) {
        knowledgeSpace.buildUpperSector(&knowledgeTree)
    }
    
    /**
     Function to get the location of a point relative to another position
        - Parameters:
            - dotCoordinates: Coordinates dot for get the location
            - rootSquare: Square relative to the center of which the position is calculated.
        - Returns: String with position name.
     */
    
    func getCornerLocationForDot(for dotCoordinates: (x: Float, y: Float), square rootSquare: Square) -> String {
        let rootCenter: (x: Float, y: Float) = rootSquare.centerLocation
        let lenSide = Float(rootSquare.lengthSide / 2)
        if (rootCenter.x + lenSide == dotCoordinates.x && rootCenter.y - lenSide == dotCoordinates.y) {
            return "RightUpCorner"
        }
        else if (rootCenter.x + lenSide == dotCoordinates.x && rootCenter.y + lenSide == dotCoordinates.y) {
            return "RightLowCorner"
        }
        else if (rootCenter.x - lenSide == dotCoordinates.x && rootCenter.y + lenSide == dotCoordinates.y) {
            return "LeftLowCorner"
        }
        else if (rootCenter.x - lenSide == dotCoordinates.x && rootCenter.y - lenSide == dotCoordinates.y) {
            return "LeftUpCorner"
        }
        else if (rootCenter.x + lenSide == dotCoordinates.x) {
            return "RightCorner"
        }
        else if (rootCenter.x - lenSide == dotCoordinates.x) {
            return "LeftCorner"
        }
        else if (rootCenter.y - lenSide == dotCoordinates.y) {
            return "UpCorner"
        }
        else if (rootCenter.y + lenSide == dotCoordinates.y) {
            return "LowCorner"
        }
        
        return "NoneCorner"
    }
}
