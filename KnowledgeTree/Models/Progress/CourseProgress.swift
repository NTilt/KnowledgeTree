//
//  CourseProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.02.2023.
//

import Foundation


struct CourseProgress {
    private var course: Course
    private var sectionProgress: [SectionProgress] = []
    
    init(course: Course) {
        self.course = course
    }
}
