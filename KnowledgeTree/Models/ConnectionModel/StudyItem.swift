//
//  StudyItem.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 23.02.2023.
//

import Foundation

// Отсюда делать привязку для каждой группы для конкретного курса, то есть создается
// преподаватель, и CourseProgress

struct StudyItem: Identifiable {
    var id: UUID
    internal var course: Course
    internal var teachers: [Teacher]
    private var listOfGroups: [StudyGroup]
    
    init(course: Course, teachers: [Teacher], listOfGroups: [StudyGroup]) {
        self.id = UUID()
        self.course = course
        self.teachers = teachers
        self.listOfGroups = listOfGroups
    }
    
    func getTeachers() -> [Teacher] {
        return teachers
    }
    
    func getCourse() -> Course {
        return course
    }
    
    func getListOfGroups() -> [StudyGroup] {
        return listOfGroups
    }
    
    mutating func changeCourse(title: String) {
        course.title = title
    }
}

struct StudyItemModel  {
    private var studyItems = [StudyItem]()
    
    init(studyItems: [StudyItem] = [StudyItem]()) {
        self.studyItems = studyItems
    }
    
    func getItemByCourse(course: Course) -> StudyItem? {
        for item in studyItems {
            if item.getCourse() == course {
                return item
            }
        }
        return nil
    }
    
    mutating func changeCourse(studyItem: StudyItem, title: String) {
        if let itemIndex = index(of: studyItem) {
            studyItems[itemIndex].changeCourse(title: title)
        }
    }
    
    func index(of item: StudyItem) -> Int? {
        for index in 0..<studyItems.count {
            if studyItems[index].id == item.id {
                return index
            }
        }
        return nil
    }
    
    mutating func createStudyItem(course: Course,
                                  teachers: [Teacher],
                                  groups: [StudyGroup]) {
        let studyItem = StudyItem(course: course, teachers: teachers, listOfGroups: groups)
        studyItems.append(studyItem)
    }
    
    mutating func addStudyItem(item: StudyItem) {
        studyItems.append(item)
    }
    
    func getStudyItemByTeacher(by teacher: Teacher) -> [StudyItem] {
        var listOfItem: [StudyItem] = []
        for item in studyItems {
            for teacher in item.getTeachers() {
                if teacher === teacher {
                    listOfItem.append(item)
                }
            }
        }
        return listOfItem
    }
    
    func getStudyItemByCourse(by course: Course) -> [StudyItem] {
        var listOfItems: [StudyItem] = []
        for item in studyItems {
            if item.getCourse() == course {
                listOfItems.append(item)
            }
        }
        return listOfItems
    }
    
    func getCoursesByGroup(by groupNumber: Int) -> [Course] {
        var courses: [Course] = []
        for item in studyItems {
            if item.getListOfGroups().contains(where: { $0.getGroupNumber() == groupNumber }) {
                courses.append(item.getCourse())
            }
        }
        return courses
    }
    
    func getCoursesByTeacherEmail(by email: String) -> [Course] {
        var courses: [Course] = []
        for item in studyItems {
            if item.getTeachers().contains(where: {$0.getEmail() == email}) {
                courses.append(item.getCourse())
            }
        }
        return courses
    }
}

