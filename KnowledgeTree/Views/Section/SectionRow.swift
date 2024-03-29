//
//  SectionRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct SectionRow: View {
    
    var section: CourseSection = courseSections[0]
    var progress: Float
    var isOpen: Bool
    @State private var isActive = false
    @ObservedObject var studentDocument: StudentDocument
    @EnvironmentObject var model: AppModel
    @EnvironmentObject var universityDocument: UniversityDocument
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            if !isOpen {
                Image(systemName: "lock.circle")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .mask(Circle())
                    .padding(12)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .mask(Circle())
            }
            else {
                Image(section.icon)
                    .resizable()
                    .frame(width: 36, height: 36)
                    .mask(Circle())
                    .padding(12)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .mask(Circle())
                    .overlay {
                        CircularView(value: CGFloat(progress))
                    }
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
                ProgressView(value: progress)
                    .accentColor(.white)
                    .frame(maxWidth: 132 )
            }
        }
        .padding(20)
        .onTapGesture {
            if isOpen {
                isActive = true
                model.currentSectionID = section.id
                //model.currentSectionTitle = section.title
            }
        }
        .background(
            NavigationLink(destination: ActivitiesView(studentDocument: studentDocument), isActive: $isActive, label: {
                EmptyView()
            })
        )
    }
}

struct SectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SectionRow(progress: 0.4, isOpen: true, studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
    }
}

