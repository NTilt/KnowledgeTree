//
//  TeacherSectionRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct TeacherSectionRow: View {
    var section: CourseSection = courseSections[0]
    var course: Course = DataBase().courseSwift
    @State private var isActive = false
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        NavigationLink(destination: SectionEditView(section: section, course: course, sectionTitle: section.title, sectionSubTitle: section.subtitle, sectionText: section.text), label: {
            HStack(alignment: .top, spacing: 16) {
                Image(section.icon)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .mask(Circle())
                    .padding(12)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .mask(Circle())
                VStack(alignment: .leading, spacing: 8) {
                    Text(section.subtitle)
                        .font(.caption).fontWeight(.medium)
                        .foregroundColor(.secondary)
                    Text(section.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    Text(section.text)
                        .font(.caption.weight(.medium))
                        .foregroundColor(.secondary)
                }
            }
            .padding(20)
        }
        )
    }
}

struct TeacherSectionRow_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSectionRow()
    }
}
