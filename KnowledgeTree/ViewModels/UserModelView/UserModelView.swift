//
//  StudentModelView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

class UserModelView: ObservableObject {
    
    private var user: User?
    
    init(email: String) {
        let universityModel = UniversityDocument()
        self.user = universityModel.getUserByEmail(by: email)
    }
}

extension UserModelView {
    
    func getUser() -> User? {
        return user
    }
    
    func getUserName() -> String {
        return user!.getName()
    }
    
    func getUserUrlToImage() -> String? {
        return user!.getUrlToImage()
    }
    
    func getUserSecondName() -> String {
        return user!.getSecondName()
    }
    
    func getUserPhone() -> String {
        return user!.getPhone()
    }
    
    func getUserEmail() -> String {
        return user!.getEmail()
    }
}
