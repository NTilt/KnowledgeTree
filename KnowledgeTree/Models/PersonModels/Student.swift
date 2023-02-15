//
//  Student.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

struct Student: Identifiable {
    var id: UUID
    private var name: String
    private var secondName: String
    private var thirdName: String?
    private var groupNumber: Int
    private var email: String
    private var phone: String
    private var address: String?
    private var numberRecordBook: String
    private var directionOfStudy: DirectionsName
    private var ratingInGroup: Int?
    private var rationInFaculties: Int?
    private var urlToImage: String?
    
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
        self.id = UUID()
        self.name = name
        self.secondName = secondName
        self.thirdName = thirdName
        self.groupNumber = groupNumber
        self.email = email
        self.phone = phone
        self.address = address
        self.numberRecordBook = numberRecordBook
        self.directionOfStudy = directionOfStudy
        self.ratingInGroup = ratingInGroup
        self.rationInFaculties = rationInFaculties
        self.urlToImage = urlToImage
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
        self.id = UUID()
        self.name = name
        self.secondName = secondName
        self.thirdName = thirdName
        self.email = email
        self.phone = phone
        self.groupNumber = groupNumber
        self.numberRecordBook = numberRecordBook
        self.directionOfStudy = directionOfStudy
        self.urlToImage = urlToImage
    }
}

extension Student {
    
    func getNumberRecordBook() -> String {
        return numberRecordBook
    }
    
    func getName() -> String {
        return name
    }
    
    func getSecondName() -> String {
        return secondName
    }
    
    mutating func setUrlToImage(_ url: String) {
        self.urlToImage = url
    }
    
    func getUrlToImage() -> String? {
        return urlToImage
    }
    
    func getGroupNumber() -> Int {
        return groupNumber
    }
    
    func getPhone() -> String {
        return phone
    }
    
    func getEmail() -> String {
        return email
    }

}
