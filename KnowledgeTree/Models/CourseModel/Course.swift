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

var courses: [Course] = [
    
    courseCplusPlus,
    courseCSharp,
    courseGeom,
    courseMath,
    courseSwift,
    courseJava,
    courseDataBase,
    courseMachineLearning,
]

var courseMachineLearning = Course(title: "Машинное обучение и анализ данных", subtitle: "27 модулей - 44 часа", text: "Машинное обучение и анализ данных", image: "machineLearning_course", background: "Background 1", icon: "machineLearning_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1")

var courseDataBase = Course(title: "Базы данных", subtitle: "14 модулей - 20 часов", text: "Базы данных", image: "database_course", background: "Background 12", icon: "database_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground12")

var courseMath = Course(title: "Математический анализ", subtitle: "35 модулей - 55 часов", text: "Математический анализ", image: "math_course", background: "Background 6", icon: "math_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground6")

var courseGeom = Course(title: "Алгебра и геометрия", subtitle: "40 модулей - 40 часов", text: "Алгебра и геометрия", image: "geom_course", background: "Background 9", icon: "geom_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground9")

var courseCSharp = Course(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 1", icon: "c#_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1")

var courseJava = Course(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 10", icon: "java_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground10")

var courseSwift = Course(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 11", icon: "swiftui_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground11")

var courseCplusPlus = Course(
    title: "C++ для начинающих",
    subtitle: "20 модулей - 15 часов",
    text: "Научитесь создавать простые консольные приложения на языке С++",
    image: "c++_course",
    background: "Background 7",
    icon: "c++_icon",
    sections: cPlusPlusSections,
    sectionImage: "SectionBackground7"
)


var fullCourses = [
    Course(title: "C++ для начинающих", subtitle: "20 модулей - 15 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c++_course", background: "Background 1", icon: "c++_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
    Course(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 2", icon: "c#_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
    Course(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 3", icon: "java_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
    Course(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 4", icon: "swiftui_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1"),
]


