//
//  Tab.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Главная", icon: "house", tab: .home, color: Color.teal),
    TabItem(text: "Обучение", icon: "graduationcap", tab: .study, color: .green),
    TabItem(text: "Рейтинг", icon: "tablecells", tab: .rating, color: .pink),
    TabItem(text: "Профиль", icon: "person", tab: .profile, color: .orange),
]

enum Tab: String {
    case home
    case study
    case rating
    case profile
}

struct TabTeacherItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: TeacherTab
    var color: Color
}

var tabTeacherItems = [
    TabTeacherItem(text: "Главная", icon: "house", tab: .home, color: Color.teal),
    TabTeacherItem(text: "Редактировать", icon: "slider.horizontal.3", tab: .edit, color: .green),
    TabTeacherItem(text: "Рейтинг", icon: "tablecells", tab: .rating, color: .pink),
    TabTeacherItem(text: "Профиль", icon: "person", tab: .profile, color: .orange),
]

enum TeacherTab: String {
    case home
    case edit
    case rating
    case profile
}

