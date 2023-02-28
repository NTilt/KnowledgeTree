//
//  StudentSectionProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.02.2023.
//

import Foundation


class StudentSectionProgress: ObservableObject {
    
    private var course: Course
    private var openSections: [CourseSection]
    
    init(course: Course, openSections: [CourseSection]) {
        self.course = course
        self.openSections = openSections
    }
}

extension StudentSectionProgress {
    
    func addSectionToOpen(section: CourseSection) {
        openSections.append(section)
    }
    
    func getCourse() -> Course {
        return course
    }
    
    func getOpenSections() -> [CourseSection] {
        return openSections
    }
}
