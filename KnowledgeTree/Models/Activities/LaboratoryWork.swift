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
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String) {
        
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .laboratoryWork, progress: .notStarted)
    }
}

var labWorks = [
    work1,
    work2
]

var work1 = LaboratoryWork(title: "Проверка знаний", subtitle: "Лабораторная работа 1", logo: "c++_icon", image: "c++_course", text: "")

var work2 = LaboratoryWork(title: "Проверка знаний", subtitle: "Лабораторная работа 2", logo: "c++_icon", image: "c++_course", text: "")
