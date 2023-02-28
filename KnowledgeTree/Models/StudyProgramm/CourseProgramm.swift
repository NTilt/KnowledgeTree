//
//  CourseProgramm.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 27.02.2023.
//

import Foundation

enum CourseCategory {
    case base
    case advanced
}


struct CourseProgramm {
    private var course: Course
    private var childCourses: [Course]
    private var courseCategory: CourseCategory
    
    
    init(course: Course, childCourses: [Course]) {
        self.course = course
        self.childCourses = childCourses
        self.courseCategory = .base
    }
    
    init(course: Course, childCourses: [Course], category: CourseCategory) {
        self.course = course
        self.childCourses = childCourses
        self.courseCategory = category
    }
}

extension CourseProgramm {
    
    func getCourse() -> Course {
        return course
    }
    
    func getChildsCourses() -> [Course] {
        return childCourses
    }
    
    func getCourseCategory() -> CourseCategory {
        return courseCategory
    }
}
