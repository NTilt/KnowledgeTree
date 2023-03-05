//
//  UserDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import Foundation

class UserDocument: ObservableObject {
    
    @Published var user: User
    @Published private(set) var dataBase = DataBase()
    
    init(user: User) {
        self.user = user
    }
    
}
