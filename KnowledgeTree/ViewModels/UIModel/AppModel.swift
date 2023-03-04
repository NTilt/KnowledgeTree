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
    @Published var email: String = "yasenikns@sgu.ru"
    @Published var accessLevel: AccessLevel = .student
    @Published var groupNumber: Int? = 441
    @Published var currentCourseTitle: String = ""
    @Published var currentSectionTitle: String = ""
    @Published var currentActivityTitle: String = ""
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
