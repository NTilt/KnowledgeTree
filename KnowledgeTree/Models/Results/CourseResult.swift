//
//  CourseResults.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 08.03.2023.
//

import Foundation

struct CourseResult: Identifiable {
    var id: Int
    private var course: Course
    private var admittedStudents: [Student]
    
    init(id: Int, course: Course, admittedStudents: [Student]) {
        self.id = id
        self.course = course
        self.admittedStudents = admittedStudents
    }
    
    mutating func addStudent(student: Student) {
        admittedStudents.append(student)
    }
    
    func getCourse() -> Course {
        return course
    }
    
    func getAdmittedStudents() -> [Student] {
        return admittedStudents
    }
    
    func studentIsAdmitted(student: Student) -> Bool {
        return admittedStudents.contains(where: {$0 == student})
    }
    
    mutating func changeCourse(title: String?, subTitle: String?, text: String?) {
        if let newTitle = title {
            course.title = newTitle
        }
        if let newSubTitle = subTitle {
            course.subtitle = newSubTitle
        }
        if let newText = text {
            course.text = newText
        }
    }
}

struct CourseResultModel {
    private var results = [CourseResult]()
    
    private var uniqueId: Int
    
    init(results: [CourseResult] = [CourseResult]()) {
        self.results = results
        uniqueId = self.results.isEmpty ? 0 : self.results.last!.id + 1
    }
}

extension CourseResultModel {
    
    mutating func changeCourse(course: Course, title: String?, subTitle: String?, text: String?) {
        if let result = getResultsForCourse(for: course) {
            if let index = index(of: result) {
                results[index].changeCourse(title: title, subTitle: subTitle, text: text)
            }
        }
    }
    
    func checkStudentInCourse(student: Student, course: Course) -> Bool? {
        guard let result = getResultsForCourse(for: course) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].studentIsAdmitted(student: student)
    }
    
    func getAllOpenCoursesForStudent(for student: Student) -> [Course] {
        var courses: [Course] = []
        for result in results {
            if result.getAdmittedStudents().contains(where: {$0 == student}) {
                courses.append(result.getCourse())
            }
        }
        return courses
    }
    
    mutating func addCourseResult(course: Course, students: [Student]) {
        let result = CourseResult(id: uniqueId, course: course, admittedStudents: students)
        uniqueId += 1
        results.append(result)
    }
    
    func getAdmittedStudentsByCourse(by course: Course) -> [Student]? {
        if let result = getResultsForCourse(for: course) {
            if let index = index(of: result) {
                return results[index].getAdmittedStudents()
            }
        }
        return nil
    }
    
    mutating func addStudentToCourse(course: Course, student: Student) {
        if let result = getResultsForCourse(for: course) {
            if let indexResult = index(of: result) {
                results[indexResult].addStudent(student: student)
            }
        }
    }
    
    func getResultsForCourse(for course: Course) -> CourseResult? {
        for result in results {
            if result.getCourse() == course {
                return result
            }
        }
        return nil
    }
    
    func index(of result: CourseResult) -> Int? {
        for index in 0..<results.count {
            if results[index].id == result.id {
                return index
            }
        }
        return nil
    }
}
