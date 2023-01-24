//
//  Storage.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import Foundation


class Storage: ObservableObject {
    
    @Published var storage: [KnowledgeTreeDocument] = []
    
    init() {
        let document1 = KnowledgeTreeDocument(test: true)
        self.storage.append(document1)
    }
    
    func update() {
        objectWillChange.send()
    }
    
    func getDocumentByName(by inputName: String) -> KnowledgeTreeDocument? {
        return self.storage[0]
    }

}
