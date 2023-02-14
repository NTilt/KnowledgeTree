//
//  KnowledgeTreeModel.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import Foundation
import SwiftUI

struct KnowledgeTreeModel {
    private(set) var vertexes = [Vertex]()
    
    struct Vertex: Identifiable {
        
        var isLocked: Bool = true
        var isDraw: Bool = false
        var location: (Float, Float)?
        var size: Int
        var text: String
        var icon: Image? = nil
        var id: Int
        var childList: [Int]
        var parentList: [Int]
        
        
        init(isLocked: Bool, isDraw: Bool, location: (Float, Float),
    size: Int, text: String, id: Int, childList: [Int]) {
            self.isLocked = isLocked
            self.isDraw = isDraw
            self.location = location
            self.size = size
            self.text = text
            self.icon = nil
            self.id = id
            self.childList = childList
            self.parentList = []
        }
        
        init(isLocked: Bool, isDraw: Bool, size: Int, text: String, id: Int, childList: [Int]) {
            self.isLocked = isLocked
            self.isDraw = isDraw
            self.location = nil
            self.size = size
            self.text = text
            self.icon = nil
            self.id = id
            self.childList = childList
            self.parentList = []
        }
        
        mutating func addParent(_ vertex: Vertex) {
            parentList.append(vertex.id)
        }
        
    }
    
    init() {}
    
    private var uniqueVertexId = 0
    
    mutating func addVertex(vertex: Vertex) {
        vertexes.append(vertex)
    }
    
    mutating func addVertex(lock isLocked: Bool, draw isDraw: Bool,  at location: (Float, Float),
                            _ size: Int, _ text: String, _ childList: [Int]) {
        uniqueVertexId += 1
        vertexes.append(Vertex(isLocked: isLocked,
                               isDraw: isDraw,
                               location: location,
                               size: size,
                               text: text,
                               id: uniqueVertexId,
                               childList: childList))
    }
    
    mutating func changeLocation(_ vertex: Vertex, _ location: (x: Float, y: Float)) {
        if let learnIndex = index(of: vertex) {
            vertexes[learnIndex].location = location
        }
    }
    
    mutating func addVertex(lock isLocked: Bool, draw isDraw: Bool,
                            _ size: Int, _ text: String, _ childList: [Int]) {
        uniqueVertexId += 1
        vertexes.append(Vertex(isLocked: isLocked,
                               isDraw: isDraw,
                               size: size,
                               text: text,
                               id: uniqueVertexId,
                               childList: childList))
    }
    
    
    
    mutating func linkAll() {
        for parent in vertexes {
            for ind in parent.childList {
                for i in 1...vertexes.count {
                    if i == ind {
                        vertexes[i].addParent(parent)
                    }
                }
            }
        }
    }

    

    
    mutating func learn(_ vertex: Vertex) {
        if let learnIndex = index(of: vertex) {
            vertexes[learnIndex].isLocked = false
        }
    }
    
    mutating func unLearn(_ vertex: Vertex) {
        if let learnIndex = index(of: vertex) {
            vertexes[learnIndex].isLocked = true
        }
    }
    
    mutating func draw(_ vertex: Vertex) {
        if let drawIndex = index(of: vertex) {
            vertexes[drawIndex].isDraw = true
        }
    }
    
    mutating func unDraw(_ vertex: Vertex) {
        if let drawIndex = index(of: vertex) {
            vertexes[drawIndex].isDraw = false
        }
    }
    
    func index(of vertex: Vertex) -> Int? {
        for index in 0..<vertexes.count {
            if vertexes[index].id == vertex.id {
                return index
            }
        }
        return nil
    }
    
    func getVertexFromLocation(from location: Location) -> Vertex? {
        for vertex in vertexes {
            if vertex.location?.0 == location.x && vertex.location?.1 == location.y {
                return vertex
            }
        }
        return nil
    }
    
    func getVertexFromIndex(from index: Int) -> Vertex? {
        for vertex in vertexes {
            if vertex.id == index {
                return vertex
            }
        }
        return nil
    }
    
    func checkLearnedParents(of vertex: Vertex) -> Bool {
        for parentIndex in vertex.parentList {
            let parent = getVertexFromIndex(from: parentIndex)
            if parent!.isLocked {
                return false
            }
        }
        return true
    }
    
}
