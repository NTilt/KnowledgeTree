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
    var activities: [ActivityType] = []
    
    init(title: String, subtitle: String, text: String, image: String, background: String, icon: String, progress: CGFloat) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.image = image
        self.background = background
        self.icon = icon
        self.progress = progress
    }
    
    init(title: String, subtitle: String, text: String, image: String, background: String, icon: String) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.image = image
        self.background = background
        self.icon = icon
        self.progress = 0
    }
    
    init(title: String, subtitle: String, text: String, image: String, background: String, icon: String, activities: [ActivityType]) {
        self.title = title
        self.subtitle = subtitle
        self.text = text
        self.image = image
        self.background = background
        self.icon = icon
        self.progress = 0
        self.activities = activities
    }
}

extension CourseSection {
    func getSectionProgress() -> CGFloat {
        let doneActivity = getDoneActivities()
        return CGFloat(doneActivity.count) / CGFloat(self.activities.count)
    }
    
    func getDoneActivities() -> [ActivityType] {
        var doneActivity: [ActivityType] = []
        for activity in self.activities {
            if activity.progress == .done {
                doneActivity.append(activity)
            }
        }
        return doneActivity
    }
}


extension CourseSection: Equatable {
    static func == (lhs: CourseSection, rhs: CourseSection) -> Bool {
        return lhs.title == rhs.title
    }
}


var courseSections = [
    CourseSection(title: "Основы С++", subtitle: "7 разделов - 30 часов", text: "Вы познакомитесь с основными возможностями языка С++", image: "c++_course", background: "Background 1", icon: "c++_icon"),
    CourseSection(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 1", icon: "c#_icon"),
    CourseSection(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 1", icon: "java_icon"),
    CourseSection(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 1", icon: "swiftui_icon"),
]

