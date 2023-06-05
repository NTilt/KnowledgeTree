//
//  Activities.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.06.2023.
//

import Foundation

struct CourseFireBase: Identifiable {
    var id: String
    var title: String
    var subtitle: String
    var text: String
    
    
    var representation: [String: Any] {
        
        var repres = [String: Any]()
        
        repres["id"] = self.id
        repres["title"] = self.title
        repres["subtitle"] = self.subtitle
        repres["text"] = self.text
        
        return repres
    }
}
