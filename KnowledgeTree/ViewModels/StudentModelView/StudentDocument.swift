//
//  StudentDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 27.02.2023.
//

import Foundation

class StudentDocument: ObservableObject {

    @Published var student: Student
    @Published private(set) var studentCourses: StudentCourses
    @Published private(set) var dataBase = DataBase()
    
    init(student: Student) {
        self.student = student
        var allCourses: [Course] = []
        var openCourses: [Course] = []
        var sectionsProgress: [StudentSectionProgress] = []
        let dataBase = DataBase()
        let programmForStudent = dataBase.getProgrammForStudent(student: student)
        
        for courseProgramm in programmForStudent {
            allCourses.append(courseProgramm.getCourse())
            if courseProgramm.getCourseCategory() == .base {
                openCourses.append(courseProgramm.getCourse())
            }
        }
        
        for course in openCourses {
            var openSectionsForCourse: [CourseSection] = []
            if let sections = dataBase.getSectionProgrammsByCourse(course: course) {
                for item in sections {
                    if item.getSectionCategory() == .base {
                        openSectionsForCourse.append(item.getSection())
                    }
                }
            }
            let item = StudentSectionProgress(course: course, openSections: openSectionsForCourse)
            sectionsProgress.append(item)
        }
        self.studentCourses = StudentCourses(student: student, allCourses: allCourses, openCourses: openCourses, sectionProgress: sectionsProgress)
    }
}

extension StudentDocument {
    
    func getActivities(courseTitle: String, sectionTitle: String) -> [ActivityType] {
        return studentCourses.getActivities(courseTitle: courseTitle, sectionTitle: sectionTitle)
    }
    
    func doneActivity(courseTitle: String, sectionTitle: String, activityTitle: String) {
        studentCourses.doneActivity(courseTitle: courseTitle, sectionTitle: sectionTitle, activityTitle: activityTitle)
    }
    
    func openNewSectionsByTitle(courseTitle: String, sectionTitle: String) {
        if let course = dataBase.getCourseByTitle(title: courseTitle) {
            if let sectionProgramm = dataBase.getSectionProgrammsByCourse(course: course) {
                for item in sectionProgramm {
                    if item.getSection().title == sectionTitle {
                        studentCourses.openSectionForCourse(course: course, sections: item.getChildsSections())
                    }
                }
                
            }
        }
    }
    
    func isSectionOpenForCourse(for course: Course, section: CourseSection) -> Bool {
        studentCourses.isSectionOpenForCourse(for: course, section: section)
    }
    
    func getSectionProgress() -> [StudentSectionProgress] {
        studentCourses.getSectionProgress()
    }
    
    func getOpenCourses() -> [Course] {
        studentCourses.getOpenCourses()
    }
    
    func getAllCourses() -> [Course] {
        studentCourses.getAllCourses()
    }
    
    func openNewCoursesByTitle(title: String) {
        let courses = dataBase.getChildsCourseFromTitle(title: title)
        self.studentCourses.addOpenCourses(courses: courses)
        // тут надо добавлять сразу лекции которые доступны изначально
        for course in courses {
            var openSectionsForCourse: [CourseSection] = []
            if let sections = dataBase.getSectionProgrammsByCourse(course: course) {
                for item in sections {
                    if item.getSectionCategory() == .base {
                        openSectionsForCourse.append(item.getSection())
                    }
                }
            }
            self.studentCourses.addSectionProgress(course: course, sections: openSectionsForCourse)
        }
    }
    
    func getOpenCourseByTitle(title: String) -> Course? {
        for item in getOpenCourses() {
            if item.title == title {
                return item
            }
        }
        return nil
    }
    
}
