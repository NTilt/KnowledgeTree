//
//  ProgressDataBase.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 26.02.2023.
//

import Foundation


class ProgressDataBase: ObservableObject {
    var dataBase = DataBase()
    private lazy var studentsProgress: [StudentProgress] = [
        StudentProgress(student: dataBase.studentNikita, courseProgress: [
            CourseProgress(course: courseSwift),
            CourseProgress(course: courseCplusPlus)
        ]),
        
        StudentProgress(student: dataBase.studentSergey, courseProgress: [
            CourseProgress(course: courseSwift),
            CourseProgress(course: courseCplusPlus),
            CourseProgress(course: courseJava)
        ])
    ]
}

extension ProgressDataBase {
    
    func getStudentProgress(student: Student) -> StudentProgress? {
        for progress in studentsProgress {
            if progress.getStudent() == student {
                return progress
            }
        }
        return nil
    }
    
    func getProgressByStudentEmail(email: String) -> StudentProgress? {
        for progress in studentsProgress {
            if progress.getStudent().getEmail() == email {
                return progress
            }
        }
        return nil
    }
}



