//
//  PersonSecurityModel.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.02.2023.
//

import Foundation

enum AccessLevel {
    case teacher
    case student
    case admin
    case base
}

struct UserSecurity {
    private var login: String
    private var password: String
    private var accessLevel: AccessLevel = .base
    
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
    init(login: String, password: String, accessLevel: AccessLevel) {
        self.login = login
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
    
    func getLogin() -> String {
        return login
    }
}
