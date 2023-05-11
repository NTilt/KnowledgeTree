//
//  StudentsRating.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 11.05.2023.
//

import Foundation

struct StudentRating {
    var student: Student
    var ratingScore: Int
    
    mutating func addScore(score: Int) {
        self.ratingScore += score
    }
}


struct StudentRatingModel {
    private(set) var studentsRatingList: [StudentRating] = [StudentRating]()
    
    init(students: [Student]) {
        var score: Int = 0
        for student in students {
            studentsRatingList.append(StudentRating(student: student, ratingScore: score))
            score += 10
        }
    }
    
    func sortedStudents() -> [StudentRating] {
        return self.studentsRatingList.sorted { lhs, rhs in
            lhs.ratingScore > rhs.ratingScore
        }
    }
    
    mutating func addStudent(student: Student, score: Int = 0) {
        if !studentsRatingList.contains(where: { studentRating in
            studentRating.student == student
        }) {
            studentsRatingList.append(StudentRating(student: student, ratingScore: score))
        }
    }
    
    mutating func addScoreForStudent(for student: Student, score: Int) {
        if studentsRatingList.contains(where: { rating in
            rating.student == student
        }) {
            let prevScore = getStudentRating(student: student)!.ratingScore
            let newScore = prevScore + score
            studentsRatingList.removeAll { rating in
                rating.student == student
            }
            studentsRatingList.append(StudentRating(student: student, ratingScore: newScore))
        }
    }
    
    func getStudentRating(student: Student) -> StudentRating? {
        studentsRatingList.first { rating in
            rating.student == student
        }
    }
}
