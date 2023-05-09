//
//  EvaluatedWorkStore.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 09.05.2023.
//

import Foundation

struct EvaluatedWorkRepository {
    private(set) var works: [any Evaluated] = []
    
    mutating func addWork(work: any Evaluated) {
        self.works.append(work)
    }
}
