//
//  StudentCourses.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 27.02.2023.
//

import Foundation

struct StudentCourses {
    
    private var student: Student
    private var allCourses: [Course]
    private var openCourses: [Course]
    
    init(student: Student, allCourses: [Course], openCourses: [Course]) {
        self.student = student
        self.allCourses = allCourses
        self.openCourses = openCourses
    }
}

extension StudentCourses {
    
    func getStudent() -> Student {
        return student
    }
    
    func getAllCourses() -> [Course] {
        return allCourses
    }
    
    func getOpenCourses() -> [Course] {
        return openCourses
    }
}
