//
//  CourseModel.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String 
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var icon: String
    var sections: [CourseSection]
    var sectionImage: String
    
    func getID() -> UUID {
        return id
    }
    
}

extension Course {
    
    mutating func changeCourseSection(sectionID: UUID, title: String?, subTitle: String?, text: String?) {
        if let sectionIndex = indexOfSection(of: sectionID) {
            if let newTitle = title {
                sections[sectionIndex].title = newTitle
            }
            if let newSubTitle = subTitle {
                sections[sectionIndex].subtitle = newSubTitle
            }
            if let newText = text {
                sections[sectionIndex].text = newText
            }
        }
    }
    
    func indexOfSection(of sectionID: UUID) -> Int? {
        for index in 0..<sections.count {
            if sections[index].id == sectionID {
                return index
            }
        }
        return nil
    }
    
    func getSectionByID(sectionID: UUID) -> CourseSection? {
        for section in sections {
            if section.id == sectionID {
                return section
            }
        }
        return nil
    }
    
    func getSectionByTitle(title: String) -> CourseSection? {
        for section in sections {
            if section.title == title {
                return section
            }
        }
        return nil
    }
    
    
    mutating func updateTitle(newTitle: String) {
        self.title = newTitle
    }
    
}

extension Course: Equatable {
    static func == (lhs: Course, rhs: Course) -> Bool {
        return lhs.title == rhs.title
    }
}


//var fullCourses = [
//    Course(title: "C++ для начинающих", subtitle: "20 модулей - 15 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c++_course", background: "Background 1", icon: "c++_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
//    Course(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 2", icon: "c#_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
//    Course(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 3", icon: "java_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
//    Course(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 4", icon: "swiftui_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
//]


