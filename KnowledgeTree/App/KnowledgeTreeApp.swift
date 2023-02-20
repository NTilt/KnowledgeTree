//
//  KnowledgeTreeApp.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

@main
struct KnowledgeTreeApp: App {
    @StateObject var model = Model()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
