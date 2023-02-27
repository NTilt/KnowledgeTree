//
//  StudentProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.02.2023.
//

import Foundation

/**
 StudentProgress необходимо для связи студента, и прогресса всех его модулей, которые он проходит;.
 */

struct StudentProgress {
    private var student: Student
    private var courseProgress: [CourseProgress]
    
    init(student: Student, courseProgress: [CourseProgress]) {
        self.student = student
        self.courseProgress = courseProgress
    }
}

extension StudentProgress {
    
    func getStudent() -> Student {
        return student
    }
    
    func getCourseProgress() -> [CourseProgress] {
        return courseProgress
    }
}
