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
    @StateObject var dataBase = DataBase()
    @StateObject var progressDataBase = ProgressDataBase()
    var body: some Scene {
        WindowGroup {
            ModalView()
                .environmentObject(model)
                .environmentObject(storage)
                .environmentObject(dataBase)
                .environmentObject(progressDataBase)
//            ContentView()
//                .environmentObject(model)
        }
    }
}
