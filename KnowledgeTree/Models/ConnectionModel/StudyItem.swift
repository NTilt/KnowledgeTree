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
    
    mutating func addNewCourseSection(courseSection: CourseSection, at index: Int) {
        self.course.sections.insert(courseSection, at: index)
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
    
    mutating func changeCourseSection(sectionID: UUID, title: String?, subTitle: String?, text: String?) {
        course.changeCourseSection(sectionID: sectionID, title: title, subTitle: subTitle, text: text)
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
    
    mutating func addNewCourseSectionIn(in course: Course, section: CourseSection, ind: Int) {
        guard let studyItem = getItemByCourse(course: course) else { return }
        guard let itemIndex = index(of: studyItem) else { return }
        studyItems[itemIndex].addNewCourseSection(courseSection: section, at: ind)
    }
    
    mutating func changeCourseSection(course: Course, section: CourseSection, title: String?,
                                      subTitle: String?, text: String?) {
        
        guard let studyItem = getItemByCourse(course: course) else { return }
        guard let itemIndex = index(of: studyItem) else { return }
        studyItems[itemIndex].changeCourseSection(sectionID: section.id, title: title, subTitle: subTitle, text: text)
    }
    
    mutating func changeCourse(studyItem: StudyItem, title: String?, subTitle: String?, text: String?) {
        if let itemIndex = index(of: studyItem) {
            studyItems[itemIndex].changeCourse(title: title, subTitle: subTitle, text: text)
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
    
    func getAllCoursesForStudent() -> [Course] {
        var courses: [Course] = []
        for item in studyItems {
            courses.append(item.getCourse())
        }
        return courses
    }
}

