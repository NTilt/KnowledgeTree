//
//  StudentDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 27.02.2023.
//

import Foundation
import Combine

class StudentDocument: ObservableObject {

    var student: Student
    private var universityDocument: UniversityDocument
    @Published private(set) var studentCourses: StudentCourses
    private var studentsEvaluatedWorks: [any Evaluated] = []
    @Published var studentsNotifications: [any Notification] = []
    var cancellable = Set<AnyCancellable>()
    
    init(student: Student, universityDocument: UniversityDocument) {
        print("StudentDocument")
        self.universityDocument = universityDocument
        self.student = student
        let allCourses: [Course] = universityDocument.getAllCoursesForStudent()
        
        let openCourses: [Course] = universityDocument.getOpenCoursesForStudent(email: student.getEmail()) ?? []
        var sectionsProgress: [StudentSectionProgress] = []
        for course in openCourses {
            
            var openSectionsForCourse: [CourseSection] = []
            if let sections = universityDocument.getSectionProgrammsByCourse(course: course) {
                for item in sections {
                    if universityDocument.haveAccessStudentForSection(course: course, section: item.getSection(), student: student) {
                        openSectionsForCourse.append(item.getSection())
                    }
                }
            }
            let item = StudentSectionProgress(course: course, openSections: openSectionsForCourse)
            sectionsProgress.append(item)
        }
        self.studentCourses = StudentCourses(student: student, allCourses: allCourses, openCourses: openCourses, sectionProgress: sectionsProgress)
        
        universityDocument.$notificationCenter.sink { [weak self] center in
            for notification in center.notifications {
                if let student = (notification.notificationFor as? Student) {
                    if student == self?.student {
                        print("Уведомление для студента Никита!")
                        self?.studentsNotifications.append(notification)
                    }
                }
            }
        }
        .store(in: &cancellable)
    }
}

extension StudentDocument {
    
    func updateCourseSections() {
        let allCourses: [Course] = universityDocument.getAllCoursesForStudent()
        let openCourses: [Course] = universityDocument.getOpenCoursesForStudent(email: student.getEmail()) ?? []
        var sectionsProgress: [StudentSectionProgress] = []
        for course in openCourses {
            
            var openSectionsForCourse: [CourseSection] = []
            if let sections = universityDocument.getSectionProgrammsByCourse(course: course) {
                for item in sections {
                    if universityDocument.haveAccessStudentForSection(course: course, section: item.getSection(), student: student) {
                        openSectionsForCourse.append(item.getSection())
                    }
                }
            }
            let item = StudentSectionProgress(course: course, openSections: openSectionsForCourse)
            sectionsProgress.append(item)
        }
        self.studentCourses = StudentCourses(student: student, allCourses: allCourses, openCourses: openCourses, sectionProgress: sectionsProgress)
    }
    
    func removeNotificationByID(id: UUID) {
        self.universityDocument.removeNotificationByID(id: id)
        self.studentsNotifications.removeAll { notification in
            notification.id == id
        }
    }
    
    func openNewSectionsByTitle(courseTitle: String, sectionTitle: String) {
        if let course = universityDocument.getCourseByTitle(title: courseTitle) {
            if let sectionProgramm = universityDocument.getSectionProgrammsByCourse(course: course) {
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
        let courses = universityDocument.getChildsCourseFromTitle(title: title)
        self.studentCourses.addOpenCourses(courses: courses)
        // тут надо добавлять сразу лекции которые доступны изначально
        for course in courses {
            var openSectionsForCourse: [CourseSection] = []
            if let sections = universityDocument.getSectionProgrammsByCourse(course: course) {
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
