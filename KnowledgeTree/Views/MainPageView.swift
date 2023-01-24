//
//  MainPageView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import SwiftUI

struct MainPageView: View {
    
    @Binding var pageIndex: Int
    @Binding var currentVertexName: String
    
    var body: some View {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    Circle()
                        .foregroundColor(.green)
                        .opacity(0.4)
                        .frame(width: 250, height: 250)
                        .overlay(
                            Circle().stroke(Color.green, lineWidth: 4)
                        )
                    Text("Some text")
                        .font(.custom("FONT_NAME", size: 30))
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    pageIndex = 1
                    currentVertexName = 
                }
                
            }
                
        }
}
