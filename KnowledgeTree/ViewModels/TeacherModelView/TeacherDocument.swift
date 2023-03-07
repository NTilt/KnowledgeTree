//
//  TeacherDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import Foundation


class TeacherDocument: UserDocument {
    
    @Published var teacher: Teacher
    @Published private(set) var teacherCourses: [Course]
    
    init(teacher: Teacher) {
        self.teacher = teacher
        self.teacherCourses = []
        super.init(user: teacher as User)
        let courses = universityDocument.getCoursesForTeacher(teacherEmail: teacher.getEmail())
        self.teacherCourses = courses
    }
    
}

extension TeacherDocument {
    
    func getCourseByTitle(title: String) -> Course {
        for course in teacherCourses {
            if course.title == title {
                return course
            }
        }
        
        return courseJava
    }
    
    func getTeacherCourses() -> [Course] {
        return self.teacherCourses
    }
    
}
