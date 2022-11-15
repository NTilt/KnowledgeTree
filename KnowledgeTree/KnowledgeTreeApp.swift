//
//  KnowledgeTreeApp.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

@main
struct KnowledgeTreeApp: App {
    let document = KnowledgeTreeDocument()
    var body: some Scene {
        WindowGroup {
            KnowledgeTreeDocumentView(document: document)
                .preferredColorScheme(.dark)
        }
    }
}
