//
//  Evaluated.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 09.05.2023.
//

import Foundation

enum Grade: String {
    case unsatisfactory = "Не удовлетворительно"
    case satisfactory = "Удовлетворительно"
    case good = "Хорошо"
    case excellent = "Отлично"
}


enum Offset: String {
    case pass = "Зачет"
    case fail = "Не зачет"
}

enum EvaluatedType: String {
    case rating = "Рейтинговый"
    case classic = "Обычный"
}


protocol Evaluated {
    associatedtype Output
    
    var grade: Output { get set }
    var type: EvaluatedType { get set }
    var examiner: Teacher { get set }
    var student: Student { get set }
}
