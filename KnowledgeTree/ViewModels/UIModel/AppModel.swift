//
//  Model.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI
import Combine

class AppModel: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModel: Modal = .signIn
    @Published var email: String = "teacher@sgu.ru"
    @Published var accessLevel: AccessLevel = .teacher
    @Published var groupNumber: Int? = nil
//    @Published var currentCourseTitle: String = ""
//    @Published var currentSectionTitle: String = ""
//    @Published var currentActivityTitle: String = ""
    @Published var currentCourseId: UUID = UUID()
    @Published var currentSectionID: UUID = UUID()
    @Published var currentActivityId: UUID = UUID()
}

extension AppModel {
    
    func setGroupNumber(number: Int) {
        groupNumber = number
    }
    
    func getAccessLevel() -> AccessLevel {
        return accessLevel
    }
}


enum Modal: String {
    case signUp
    case signIn
}
