//
//  TeacherSectionRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct TeacherSectionRow: View {
    var section: CourseSection = courseSections[0]
    @State private var isActive = false
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(section.icon)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay {
                    CircularView(value: section.getSectionProgress())
                }
            VStack(alignment: .leading, spacing: 8) {
                Text(section.subtitle)
                    .font(.caption).fontWeight(.medium)
                    .foregroundColor(.secondary)
                Text(section.title)
                    .fontWeight(.semibold)
                Text(section.text)
                    .font(.caption.weight(.medium))
                    .foregroundColor(.secondary)
                ProgressView(value: section.progress)
                    .accentColor(.white)
                    .frame(maxWidth: 132 )
            }
        }
        .padding(20)
//        .onTapGesture {
//            if isOpen {
//                isActive = true
//                model.currentSectionTitle = section.title
//            }
//        }
//        .background(
//            NavigationLink(destination: ActivitiesView(studentDocument: studentDocument), isActive: $isActive, label: {
//                EmptyView()
//            })
//        )
    }
}

struct TeacherSectionRow_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSectionRow()
    }
}
