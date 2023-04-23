//
//  LectionItem.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivityItem: View {
    
    var activity: ActivityType = activities[0]
    @ObservedObject var studentDocument: StudentDocument
    @State private var isActive = false
    @State var showWork = false
    var completion: () -> Void
    
    @ViewBuilder
    private var sectionView: some View {
        switch activity.type {
        case .lection:
            SectionView(lection: activity as! Lection, studentDocument: studentDocument)
        case .testWork:
            TestWorkStudentView(testWork: activity as! TestWork, arr: [:], isStarted: .constant(true))
        case .laboratoryWork, .practice:
            EmptyView()
        }
    }
    
    private var colors: [Color] {
        if activity.progress == .done {
            return [.green, Color("topGreen")]
        }
        else {
            switch activity.type {
            case .lection:
                return [.blue, .teal]
            case .practice, .testWork:
                return [.red, .pink]
            case.laboratoryWork:
                return [.orange, .yellow]
            }
        }
    }
    
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
                .fill(.linearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing ))
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
        .onTapGesture {
            self.isActive = true
        }
        .background(
            NavigationLink(destination: sectionView, isActive: $isActive, label: {
                EmptyView()
            })
        )
    }
}

struct LectionItem_Previews: PreviewProvider {
    static var previews: some View {
        ActivityItem(activity: activities[1], studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()), completion: {})
    }
}
