//
//  Lection.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import Foundation

class Lection: ActivityType {
    var logo: String
    var text: String
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         progress: StudyActivityProgress,
         text: String) {
        
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .lection, progress: progress)
    }
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String) {
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .lection, progress: .notStarted)
    }
}

var lections = [
    lection1,
    lection2,
    Lection(title: "Ветвления и циклы", subtitle: "Лекция 3", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Do While", subtitle: "Лекция 4", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Библиотеки", subtitle: "Лекция 5", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Структуры данных", subtitle: "Лекция 6", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Введение в язык", subtitle: "Лекция 1", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Переменные и типы", subtitle: "Лекция 2", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Ветвления и циклы", subtitle: "Лекция 3", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Do While", subtitle: "Лекция 4", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Библиотеки", subtitle: "Лекция 5", logo: "c++_icon", image: "c++_course", text: ""),
    Lection(title: "Структуры данных", subtitle: "Лекция 6", logo: "c++_icon", image: "c++_course", text: "")
]

var lection1 = Lection(title: "Введение в язык", subtitle: "Лекция 1", logo: "c++_icon", image: "c++_course", text: "")

var lection2 = Lection(title: "Переменные и типы", subtitle: "Лекция 2", logo: "c++_icon", image: "c++_course", text: "")
