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
    private var sectionProgress: [StudentSectionProgress]
    
    init(student: Student, allCourses: [Course], openCourses: [Course], sectionProgress: [StudentSectionProgress]) {
        self.student = student
        self.allCourses = allCourses
        self.openCourses = openCourses
        self.sectionProgress = sectionProgress
    }
}

extension StudentCourses {
    
    func isSectionOpenForCourse(for course: Course, section: CourseSection) -> Bool {
        for item in sectionProgress {
            if item.getCourse() == course {
                let openSections = item.getOpenSections()
                if openSections.contains(where: {$0 == section}) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func getSectionProgress() -> [StudentSectionProgress] {
        return sectionProgress
    }
    
    func getStudent() -> Student {
        return student
    }
    
    func getAllCourses() -> [Course] {
        return allCourses
    }
    
    func getOpenCourses() -> [Course] {
        return openCourses
    }
    
    mutating func addOpenCourses(courses: [Course]) {
        for course in courses {
            if !openCourses.contains(course) {
                self.openCourses.append(course)
            }
        }
        
    }
}
