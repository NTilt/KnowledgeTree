//
//  StudentWorkRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.04.2023.
//

import SwiftUI

struct StudentWorkRow: View {
    var section: CourseSection = courseSections[0]
    var progress: Float
    var isOpen: Bool
    @State private var isActive = false
    @ObservedObject var studentDocument: StudentDocument
    @EnvironmentObject var model: AppModel
    @EnvironmentObject var universityDocument: UniversityDocument
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
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
    }
}

struct StudentWorkRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentWorkRow(progress: 0.5, isOpen: true, studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
    }
}
