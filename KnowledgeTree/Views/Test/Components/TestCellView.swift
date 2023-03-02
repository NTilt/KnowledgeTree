//
//  TestCellView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct TestCellView: View {
    var text: String
    var body: some View {
        Button {
            
        } label: {
            GeometryReader() { geometry in
                ZStack {
                    AngularGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                                    center: .center,
                                    angle: .degrees(0))
                    .blendMode(.overlay)
                    .blur(radius: 8)
                    .mask {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 50)
                            .frame(maxWidth: geometry.size.width )
                            .blur(radius: 8)
                    }
                    Text(text)
                        .padding(.leading)
                        .lineLimit(2)
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: geometry.size.width, height: 70, alignment: .leading)
                        .background(
                            Color("testCell")
                                .opacity(0.9)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1.0)
                                .blendMode(.normal)
                                .opacity(0.7)
                        }
                        .cornerRadius(16)
                }
            }
            .frame(height: 50)
        }
        
        
    }
}

struct TestCellView_Previews: PreviewProvider {
    static var previews: some View {
        TestCellView(text: "Показывает точку начала работы программы")
            //.preferredColorScheme(.dark)
    }
}
