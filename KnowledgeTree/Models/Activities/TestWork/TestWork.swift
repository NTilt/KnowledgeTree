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
    var listOfQuestions: [String] = []
    var executionTime: Int? = nil
    var maxScore: Int? = nil
    
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String) {
        
        self.logo = logo
        self.text = text
        super.init(title: title, subtitle: subtitle, image: image, type: .testWork, progress: .notStarted)
    }
    
    init(title: String,
         subtitle: String,
         logo: String,
         image: String,
         text: String,
         listOfQuestions: [String],
         executionTime: Int?,
         maxScore: Int?) {
        
        self.logo = logo
        self.text = text
        self.listOfQuestions = listOfQuestions
        self.executionTime = executionTime
        self.maxScore = maxScore
        super.init(title: title, subtitle: subtitle, image: image, type: .testWork, progress: .notStarted)
    }
}

var testWorks = [
    test1,
    test2
]

var test1 = TestWork(title: "Проверка знаний", subtitle: "Контрольная работа 1", logo: "c++_icon", image: "c++_course", text: "")

var test2 = TestWork(title: "Проверка знаний", subtitle: "Контрольная работа 2", logo: "c++_icon", image: "c++_course", text: "")

var test3 = TestWork(title: "Доверительные интервалы", subtitle: "Контрольная работа 3", logo: "math_icon", image: "math_course", text: "Математический анализ", listOfQuestions: ["По данным 7 измерений некоторой величины найдены средняя результатов измерений, равная 30 и выборочная дисперсия, равная 36. Найдите границы, в которых с надежностью 0,99 заключено истинное значение измеряемой величины.", "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11."], executionTime: 90, maxScore: 50)
