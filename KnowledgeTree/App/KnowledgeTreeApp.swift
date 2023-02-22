//
//  KnowledgeTreeApp.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

@main
struct KnowledgeTreeApp: App {
    @StateObject var model = AppModel()
    @StateObject var storage = Storage()
    var body: some Scene {
        WindowGroup {
            ModalView()
                .environmentObject(model)
                .environmentObject(storage)
//            ContentView()
//                .environmentObject(model)
        }
    }
}
