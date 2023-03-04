//
//  StudentActivityProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 04.03.2023.
//

import Foundation

class StudentActivityProgress: ObservableObject {
    
    private var section: Course
    private var openSections: [CourseSection]
    
    init(section: Course, openSections: [CourseSection]) {
        self.section = section
        self.openSections = openSections
    }
}

extension StudentSectionProgress {
    
}
