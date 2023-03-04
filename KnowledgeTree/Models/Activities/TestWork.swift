//
//  TestWork.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import Foundation


class TestWork: ActivityType {
    var logo: String
    var text: String
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String) {
        
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .testWork, color1: .red, color2: .purple)
    }
}

var testWorks = [
    test1,
    test2
]

var test1 = TestWork(title: "Проверка знаний", subtitle: "Контрольная работа 1", logo: "c++_icon", image: "c++_course", text: "")

var test2 = TestWork(title: "Проверка знаний", subtitle: "Контрольная работа 2", logo: "c++_icon", image: "c++_course", text: "")
