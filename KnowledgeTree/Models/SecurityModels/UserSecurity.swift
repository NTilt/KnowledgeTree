//
//  PersonSecurityModel.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.02.2023.
//

import Foundation

enum AccessLevel: String {
    case teacher
    case student
    case admin
    case base
}

struct UserSecurity {
    private var email: String
    private var password: String
    private var accessLevel: AccessLevel = .base
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    init(email: String, password: String, accessLevel: AccessLevel) {
        self.email = email
        self.password = password
        self.accessLevel = accessLevel
    }
    
}

extension UserSecurity {
    mutating func setAccessLevel(_ level: AccessLevel) {
        self.accessLevel = level
    }
    
    func getPassword() -> String {
        return password
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getAccessLevel() -> AccessLevel {
        return accessLevel
    }
}
