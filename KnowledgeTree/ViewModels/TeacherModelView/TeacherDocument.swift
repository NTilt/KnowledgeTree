//
//  TeacherDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import Foundation


//class TeacherDocument: ObservableObject {
//    
//    @Published var teacher: Teacher
//    @Published private(set) var teacherCourses: [Course]
//    
//    init(teacher: Teacher) {
//        let universityModel = UniversityDocument()
//        self.teacher = teacher
//        self.teacherCourses = []
//        self.teacherCourses = universityModel.getCoursesForTeacher(teacherEmail: teacher.getEmail())
//    }
//    
//}
//
//extension TeacherDocument {
//    
//    func getCourseByTitle(title: String) -> Course {
//        for course in teacherCourses {
//            if course.title == title {
//                return course
//            }
//        }
//        return DataBase().courseJava
//    }
//    
//    func getTeacherCourses() -> [Course] {
//        return self.teacherCourses
//    }
//    
//}
