//
//  NextView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import SwiftUI

struct NextView: View {
    @Binding var pageIndex: Int
    @State var spaceWidth: CGFloat = 5000
    @State var spaceHeight: CGFloat = 5000
    @State private var steadyZoomScale: CGFloat = 1
    @GestureState private var gestureZoomScale: CGFloat = 1
    var minimumZoomScale: CGFloat = 0
    var maximumZoomScale: CGFloat = 1.5
    var currentVertexName: String
    @StateObject var storage: Storage
    
    var body: some View {
            ScrollView ([.horizontal, .vertical]) {
                ZStack {
                    Color.black
                        .edgesIgnoringSafeArea(.all)
                    directionSpace
                }
                .frame(width: spaceWidth * zoomScale, height: spaceHeight * zoomScale)
                .scaleEffect(zoomScale)
                .gesture(zoomGesture())
            }
        }
        
        var directionSpace: some View {
            GeometryReader { directionReader in
                ZStack {
                    if let document = storage.getSubjectsBySection(by: currentVertexName) {
                        ForEach(document.vertexes) { vertex in
                            if vertex.isDraw {
                                VertexView(vertex: vertex)
                                    .onTapGesture {
                                        document.action(vertex)
                                        storage.update()
                                    }.onLongPressGesture {
                                        pageIndex = pageIndex - 1
                                        
                                    }
                                if !vertex.isLocked {
                                    ForEach(vertex.childList, id: \.self) {index in
                                        let vertexTo = document.getVertexFromIndex(from: index)
                                        if vertexTo!.isDraw {
                                            if vertex.location != nil {
                                                let path = Path { path in
                                                    var vertexFromX = vertex.location!.0 + 5
                                                    var vertexFromY = vertex.location!.1 + 15
                                                    var vertexToX = (vertexTo?.location!.0)! - 1
                                                    var vertexToY = (vertexTo?.location!.1)! + 15
                                                    let quarter = getGeometricQuarter(vertex.location!, (vertexToX, vertexToY))
                                                    (vertexFromX, vertexFromY, vertexToX, vertexToY) = getCoordinates((vertexFromX, vertexFromY), (vertexToX, vertexToY), quarter)
                                                    path.move(to: convertVertexCoordinates((vertexFromX, vertexFromY), in: directionReader))
                                                    path.addLine(to: convertVertexCoordinates((vertexToX, vertexToY), in: directionReader))
                                                            path.closeSubpath()
                                                }
                                                path.fill(Color.red).overlay(path.stroke(Color.green.opacity(0.3), lineWidth: 10))
                                            }
                                        }
                                    }
                                }
                            }
                        }

                    }
                }
            }
        }
        
        private var zoomScale: CGFloat {
            var finalZoom = steadyZoomScale * gestureZoomScale
            if finalZoom < minimumZoomScale {
                finalZoom = minimumZoomScale
            }
            if finalZoom > maximumZoomScale {
                finalZoom = maximumZoomScale
            }
            return finalZoom
        }
        
        private func zoomGesture() -> some Gesture {
            MagnificationGesture()
                .updating($gestureZoomScale) {latestGestureScale, gestureZoomScale, transaction in
                    gestureZoomScale = latestGestureScale
                }
                .onEnded {
                    gestureScaleAtEnd in
                    steadyZoomScale *= gestureScaleAtEnd
                }
        }
}

