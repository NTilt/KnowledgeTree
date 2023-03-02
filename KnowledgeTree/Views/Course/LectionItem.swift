//
//  LectionItem.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct LectionItem: View {
    
    var lection: Lection = lections[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay {
                    Image(lection.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                }
            Text(lection.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            Text(lection.subtitle)
                .font(.caption.weight(.medium))
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [lection.color1, lection.color2], startPoint: .topLeading, endPoint: .bottomTrailing ))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

struct LectionItem_Previews: PreviewProvider {
    static var previews: some View {
        LectionItem(lection: lections[0])
    }
}
