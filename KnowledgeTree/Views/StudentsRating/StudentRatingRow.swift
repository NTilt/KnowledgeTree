//
//  StudentRatingRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 03.04.2023.
//

import SwiftUI

struct StudentRatingRow: View {
    var student: Student
    var ratingNumber: Int
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            RatingNumber(ratingNumber: ratingNumber)
            VStack(alignment: .leading, spacing: 8) {
                Text("\(student.getSecondName()) \(student.getName())")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("\(student.getGroupNumber()) группа")
                    .font(.caption.weight(.medium))
                    .foregroundColor(.secondary)
            }
        }
        .padding(20)
    }
}

struct StudentRatingRow_Previews: PreviewProvider {
    static var previews: some View {
        StudentRatingRow(student: DataBase().studentNikita, ratingNumber: 10)
    }
}

