//
//  KnowledgeTreeDocumentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

struct KnowledgeTreeDocumentView: View {
    
    @ObservedObject var document: KnowledgeTreeDocument
    @State var spaceWidth: CGFloat = 5000
    @State var spaceHeigth: CGFloat = 5000
    @Binding var pageIndex: Int
    @Binding var currentVertexName: String?
    
    
    var body: some View {
        ScrollView ([.horizontal, .vertical]) {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                knowledgeSpace
            }
            .frame(width: spaceWidth * zoomScale, height: spaceHeigth * zoomScale)
            .scaleEffect(zoomScale)
            .gesture(zoomGesture())
        }
    }
    
    var knowledgeSpace: some View {
        GeometryReader { reader in
                ZStack {
                    ForEach(document.vertexes) { vertex in
                        let vertexName = vertex.text
                        if vertex.isDraw {
                                VertexView(vertex: vertex)
                                    .onTapGesture {
                                        document.action(vertex)
                                        
                                    }
                                    .onLongPressGesture {
                                        currentVertexName = vertexName
                                        pageIndex = 1
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
                                                path.move(to: convertVertexCoordinates((vertexFromX, vertexFromY), in: reader))
                                                path.addLine(to: convertVertexCoordinates((vertexToX, vertexToY), in: reader))
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
    
    @State private var steadyZoomScale: CGFloat = 1
    @GestureState private var gestureZoomScale: CGFloat = 1
    var minimumZoomScale: CGFloat = 0
    var maximumZoomScale: CGFloat = 1.5
    
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
    
    
}

//struct KnowledgeTreeDocumentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let document = KnowledgeTreeDocument()
//        
//        KnowledgeTreeDocumentView(document: document)
//            .preferredColorScheme(.dark)
//    }
//}
