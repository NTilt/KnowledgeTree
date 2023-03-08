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


