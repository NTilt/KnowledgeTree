//
//  Student.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

class Student: User {
    private var groupNumber: Int
    private var numberRecordBook: String
    private var directionOfStudy: DirectionsName
    private var ratingInGroup: Int?
    private var rationInFaculties: Int?
    private var isAnonymousMode: Bool = false
    
    init(
         name: String,
         secondName: String,
         thirdName: String?,
         groupNumber: Int,
         email: String,
         phone: String,
         address: String?,
         numberRecordBook: String,
         directionOfStudy: DirectionsName,
         ratingInGroup: Int?,
         rationInFaculties: Int?,
         urlToImage: String?
    ) {
        self.groupNumber = groupNumber
        self.numberRecordBook = numberRecordBook
        self.directionOfStudy = directionOfStudy
        self.ratingInGroup = ratingInGroup
        self.rationInFaculties = rationInFaculties
        super.init(name: name, secondName: secondName, thirdName: thirdName, email: email, phone: phone, address: address, urlToImage: urlToImage)
    }
    
    init(
        name: String,
        secondName: String,
        thirdName: String?,
        groupNumber: Int,
        email: String,
        phone: String,
        numberRecordBook: String,
        directionOfStudy: DirectionsName,
        urlToImage: String? = nil
    ) {
        self.groupNumber = groupNumber
        self.numberRecordBook = numberRecordBook
        self.directionOfStudy = directionOfStudy
        super.init(name: name, secondName: secondName, thirdName: thirdName, email: email, phone: phone, urlToImage: urlToImage)
        
    }
}

extension Student {
    
    func setAnonimMode(mode: Bool) {
        self.isAnonymousMode = mode
    }
    
    func isAnonimMode() -> Bool {
        return isAnonymousMode
    }
    
    func getNumberRecordBook() -> String {
        return numberRecordBook
    }
    
    func setUrlToImage(_ url: String) {
        self.urlToImage = url
    }
    
    func getGroupNumber() -> Int {
        return groupNumber
    }
}

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.getNumberRecordBook() == rhs.getNumberRecordBook()
    }
}

