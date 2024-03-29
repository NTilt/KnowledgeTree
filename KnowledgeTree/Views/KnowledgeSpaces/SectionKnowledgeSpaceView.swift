//
//  NextView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import SwiftUI

struct SectionKnowledgeSpaceView: View {
    @Binding var pageIndex: Int
//    @State var spaceWidth: CGFloat = 5000
//    @State var spaceHeight: CGFloat = 5000
    @State private var steadyZoomScale: CGFloat = 1
    @GestureState private var gestureZoomScale: CGFloat = 1
    var minimumZoomScale: CGFloat = 0
    var maximumZoomScale: CGFloat = 1.5
    var currentVertexName: String
    private let minScale = 0.3
    private let maxScale = 1.0
    @AppStorage("scale") var scale = 1.0
    @State private var lastScale = 1.0
    @State var stateVertexOffset = CGSize.zero
    @GestureState var gestureVertexOffset = CGSize.zero
    @StateObject var document: KnowledgeTreeDocument
    @StateObject var studentDocument: StudentDocument
    @EnvironmentObject var universityDocument: UniversityDocument
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                directionSpace
                    .position(position(in: reader))
                    .scaleEffect(scale)
            }
            .gesture(panGesture().simultaneously(with: magnification))
        }
        
    }
        
        var directionSpace: some View {
            GeometryReader { directionReader in
                ZStack {
                    if let document = document {
                        ForEach(document.vertexes) { vertex in
                            if vertex.isDraw {
                                VertexView(vertex: vertex)
                                    .onTapGesture {
                                        document.action(vertex)
                                        studentDocument.openNewSectionsByTitle(courseTitle: currentVertexName, sectionTitle: vertex.text)
                                        universityDocument.studentDoneSection(courseTitle: currentVertexName, sectionTitle: vertex.text, student: studentDocument.student)
                                        
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
    
    func getMinimumScaleAllowed() -> CGFloat {
        return max(scale, minScale)
    }
    
    func getMaximumScaleAllowed() -> CGFloat {
        return min(scale, maxScale)
    }
    
    func validateScaleLimits() {
        scale = getMinimumScaleAllowed()
        scale = getMaximumScaleAllowed()
    }
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { state in
                let delta = state / lastScale
                scale *= delta
                lastScale = state
            }
            .onEnded { state in
                withAnimation {
                    validateScaleLimits()
                }
                lastScale = 1.0
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
            .updating($gestureZoomScale) { latestGestureScale, gestureZoomScale, transaction in
                    gestureZoomScale = latestGestureScale
            }
            .onEnded { gestureScaleAtEnd in
                steadyZoomScale *= gestureScaleAtEnd
            }
    }
    
    private var vertexOffset: CGSize {
        (stateVertexOffset + gestureVertexOffset) * scale
    }
    
    private func panGesture() -> some Gesture {
        DragGesture()
            .updating($gestureVertexOffset) { lst, gestureVertexOffset, _ in
                gestureVertexOffset = lst.translation / scale
            }
            .onEnded { lastGesture in
                stateVertexOffset = stateVertexOffset + (lastGesture.translation / scale)
            }
    }
    
    private func position(in geometry: GeometryProxy) -> CGPoint {
        convertFrom((x: 0, y: 0), in: geometry)
    }
    
    private func convertFrom(_ location: (x: Int, y: Int), in geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x: center.x + CGFloat(location.x) * scale + vertexOffset.width,
            y: center.y + CGFloat(location.y) * scale + vertexOffset.height
        )
    }
}

