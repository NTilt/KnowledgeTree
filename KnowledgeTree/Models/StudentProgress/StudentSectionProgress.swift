//
//  StudentSectionProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.02.2023.
//

import Foundation


struct StudentSectionProgress {
    
    private var course: Course
    private var openSections: [CourseSection]
    
    init(course: Course, openSections: [CourseSection]) {
        self.course = course
        self.openSections = openSections
    }
}

extension StudentSectionProgress {
    
    func getCourse() -> Course {
        return course
    }
    
    func getOpenSections() -> [CourseSection] {
        return openSections
    }
}
