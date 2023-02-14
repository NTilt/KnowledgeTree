//
//  VertexView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

struct VertexView: View {
    
    var vertex: KnowledgeTreeModel.Vertex
    var nameIconLockCondition = "lock.fill"
    var nameIconUnlockCondition = "lock.open.fill"
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(vertex.text)
                    .foregroundColor(.white)
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                        .opacity(0.4)
                        .frame(width: 150, height: 150)
                        .overlay(
                            Circle().stroke(Color.green, lineWidth: 4)
                        )
                    if vertex.isLocked {
                        Image(systemName: nameIconLockCondition)
                            .font(.custom("MyFont", size: 50))
                    }
                    else {
                        Image(systemName: nameIconUnlockCondition)
                            .font(.custom("MyFont", size: 40))
                    }
                }
            }
            .position(position(for: vertex, in: geometry))
            
        }
    }
    
    private func position(for vertex: KnowledgeTreeModel.Vertex, in geometry: GeometryProxy) -> CGPoint {
        var ans: CGPoint = CGPoint(x: 0, y: 0)
        if vertex.location != nil {
            ans = convertVertexCoordinates(vertex.location!, in: geometry)
        }
        return ans
    }
    
}

