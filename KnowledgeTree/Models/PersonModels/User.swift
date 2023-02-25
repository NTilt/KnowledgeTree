//
//  User.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 23.02.2023.
//

import Foundation

class User: Identifiable {
    var id: UUID
    private var name: String
    private var secondName: String
    private var thirdName: String?
    private var email: String
    private var phone: String
    private var address: String?
    internal var urlToImage: String?
    
    init(name: String,
         secondName: String,
         thirdName: String? = nil,
         email: String,
         phone: String,
         address: String? = nil,
         urlToImage: String? = nil) {
        
        self.id = UUID()
        self.name = name
        self.secondName = secondName
        self.thirdName = thirdName
        self.email = email
        self.phone = phone
        self.address = address
        self.urlToImage = urlToImage
    }
}

extension User {
    
    func getName() -> String {
        return name
    }
    
    func getSecondName() -> String {
        return secondName
    }
    
    func getEmail() -> String {
        return email
    }
    
    func getPhone() -> String {
        return phone
    }
    
    func getUrlToImage() -> String? {
        return urlToImage
    }
}
