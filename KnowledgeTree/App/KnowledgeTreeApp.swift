//
//  KnowledgeTreeApp.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI

@main
struct KnowledgeTreeApp: App {
    private let dataBase = DataBase()
    var body: some Scene {
        WindowGroup {
            AuthView(dataBase: dataBase)
                .preferredColorScheme(.dark)
        }
    }
}
