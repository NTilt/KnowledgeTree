//
//  Teacher.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 23.02.2023.
//

import Foundation

class Teacher: User {
    
    private var experience: Int
    
    //experiment
    private var listOfCourses: [Course] = []
    
    init(name: String,
         secondName: String,
         thirdName: String? = nil,
         email: String, phone: String,
         address: String? = nil,
         urlToImage: String? = nil,
         experience: Int) {
        self.experience = experience
        super.init(name: name, secondName: secondName, thirdName: thirdName, email: email, phone: phone, address: address, urlToImage: urlToImage)
    }
}
