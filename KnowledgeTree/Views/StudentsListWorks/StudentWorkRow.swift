//
//  StudentWorkRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.04.2023.
//

import SwiftUI

struct StudentWorkRow: View {
    var work: DoneTestWork
    var number: Int
    @EnvironmentObject var universityDocument: UniversityDocument
    var currentActivity: ActivityType? {
        universityDocument.getActivityByID(courseID: work.courseID, sectionID: work.sectionID, activityID: work.activityID)
    }
    
    var body: some View {
        NavigationLink(destination: ExaminationWorkView(studentWork: work), label: {
            HStack(alignment: .center, spacing: 16) {
                RatingNumber(ratingNumber: number)
                VStack(alignment: .leading, spacing: 8) {
                    Text(currentActivity?.title ?? "Математический анализ")
                        .font(.caption).fontWeight(.medium)
                        .foregroundColor(.secondary)
                    Text("\(work.student.getSecondName()) \(work.student.getName()) ")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(currentActivity?.subtitle ?? "Контрольная работа 3")
                        .font(.caption.weight(.medium))
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(20)
        })
        
    }
}

struct StudentWorkRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentWorkRow(work: DoneTestWork(answers: [], student: DataBase().studentNikita, courseID: DataBase().courseSwift.id, sectionID: DataBase().courseSwift.sections[0].id, activityID: test3.id), number: 1)
            .environmentObject(UniversityDocument())
    }
}
