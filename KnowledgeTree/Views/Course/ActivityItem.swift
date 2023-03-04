//
//  LectionItem.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivityItem: View {
    
    var activity: ActivityType = activities[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(activity.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 90)
            Text(activity.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
                .lineLimit(2)
            Text(activity.subtitle)
                .font(.caption.weight(.medium))
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [activity.color1, activity.color2], startPoint: .topLeading, endPoint: .bottomTrailing ))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

struct LectionItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem(activity: activities[1])
    }
}
