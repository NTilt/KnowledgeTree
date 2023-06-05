//
//  KnowledgeTreeApp.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.11.2022.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct KnowledgeTreeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var model = AppModel()
    @StateObject var storage = Storage()
    @StateObject var universityDocument = UniversityDocument()
    var body: some Scene {
        WindowGroup {
            ModalView()
                .environmentObject(model)
                .environmentObject(storage)
                .environmentObject(universityDocument)
        }
    }
}
