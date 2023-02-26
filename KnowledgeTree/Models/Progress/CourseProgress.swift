//
//  CourseProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.02.2023.
//

import Foundation


class CourseProgress {
    private var course: Course
    var sectionProgress: [SectionProgress] = []
    
    init(course: Course) {
        self.course = course
        for section in course.sections {
            sectionProgress.append(SectionProgress(sectionName: section.title, progress: 0))
        }
    }
}

extension CourseProgress {
    
    func getCourse() -> Course {
        return course
    }
}
