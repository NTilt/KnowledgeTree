//
//  Answers.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.04.2023.
//

import Foundation

struct Answers: Identifiable {
    var id: UUID
    var question: String
    var answer: String?
    
    init( question: String, answer: String?) {
        self.id = UUID()
        self.question = question
        self.answer = answer
    }
}
