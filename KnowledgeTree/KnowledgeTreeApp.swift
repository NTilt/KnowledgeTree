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
    let storage = Storage()
    var body: some Scene {
        WindowGroup {
            MainView(document: document, storage: storage)
                .preferredColorScheme(.dark)
        }
    }
}
