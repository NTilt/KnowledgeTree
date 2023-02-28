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
        let dataBase = DataBase()
        let programmForStudent = dataBase.getProgrammForStudent(student: student)
        
        for courseProgramm in programmForStudent {
            allCourses.append(courseProgramm.getCourse())
            if courseProgramm.getCourseCategory() == .base {
                openCourses.append(courseProgramm.getCourse())
            }
        }
        
        self.studentCourses = StudentCourses(student: student, allCourses: allCourses, openCourses: openCourses)
    }
}

extension StudentDocument {
    
    func getOpenCourses() -> [Course] {
        studentCourses.getOpenCourses()
    }
    
    func getAllCourses() -> [Course] {
        studentCourses.getAllCourses()
    }
    
    func openNewCoursesByTitle(title: String) {
        let courses = dataBase.getCourseFromTitle(title: title)
        self.studentCourses.addOpenCourses(courses: courses)
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
