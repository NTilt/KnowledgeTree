//
//  CourseSection.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct CourseSection : Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var icon: String
    var progress: CGFloat
}

var courseSections = [
    CourseSection(title: "Основы С++", subtitle: "7 разделов - 30 часов", text: "Вы познакомитесь с основными возможностями языка С++", image: "c++_course", background: "Background 1", icon: "c++_icon", progress: 0.2),
    CourseSection(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 1", icon: "c#_icon", progress: 0.5),
    CourseSection(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 1", icon: "java_icon", progress: 0.8),
    CourseSection(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 1", icon: "swiftui_icon", progress: 1),
]

