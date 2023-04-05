//
//  LaboratoryWork.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import Foundation


class LaboratoryWork: ActivityType {
    var logo: String
    var text: String
    var executionTime: Int? = nil
    var maxScore: Int? = nil
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String) {
        
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .laboratoryWork, progress: .notStarted)
    }
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String,
         executionTime: Int?,
         maxScore: Int?) {
        
        self.logo = logo
        self.text = text
        self.executionTime = executionTime
        self.maxScore = maxScore
        super.init(title: title, subtitle: subtitle, image: image, type: .laboratoryWork, progress: .notStarted)
    }
}

var labWorks = [
    work1,
    work2
]

var work1 = LaboratoryWork(title: "Проверка знаний", subtitle: "Лабораторная работа 1", logo: "c++_icon", image: "c++_course", text: "")

var work2 = LaboratoryWork(title: "Проверка знаний", subtitle: "Лабораторная работа 2", logo: "c++_icon", image: "c++_course", text: "")

var work3 = LaboratoryWork(title: "Делегирование и делегаты", subtitle: "Лабораторная работа 3", logo: "swiftui_icon", image: "swifui_course", text: "SwiftUI", executionTime: 45, maxScore: 100)
