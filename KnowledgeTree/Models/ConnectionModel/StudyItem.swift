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
}

struct StudyItemModel  {
    private var studyItems = [StudyItem]()
    
    
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
}

