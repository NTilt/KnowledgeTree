//
//  StudentCourses.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 27.02.2023.
//

import Foundation

class StudentCourses: ObservableObject {
    
    private var student: Student
    private var allCourses: [Course]
    private var openCourses: [Course]
    @Published var sectionProgress: [StudentSectionProgress]
    
    init(student: Student, allCourses: [Course], openCourses: [Course], sectionProgress: [StudentSectionProgress]) {
        self.student = student
        self.allCourses = allCourses
        self.openCourses = openCourses
        self.sectionProgress = sectionProgress
    }
}

extension StudentCourses {
    
    func addSectionProgress(course: Course, sections: [CourseSection]) {
        sectionProgress.append(StudentSectionProgress(course: course, openSections: sections))
    }
    
    func openSectionForCourse(course: Course, sections: [CourseSection]) {
        for item in sectionProgress {
            if item.getCourse() == course {
                for section in sections {
                    item.addSectionToOpen(section: section)
                }
                
            }
        }
    }
    
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
    
    func addOpenCourses(courses: [Course]) {
        for course in courses {
            if !openCourses.contains(course) {
                self.openCourses.append(course)
            }
        }
        
    }
}
