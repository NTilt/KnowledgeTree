//
//  StudentModelView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

class StudentModelView {
    
    private var student: Student
    
    init() {
        self.student = DataBase().getAllStudents()[0]
    }
}

extension StudentModelView {
    
    func getStudentName() -> String {
        return student.getName()
    }
    
    func getStudentUrlToImage() -> String? {
        return student.getUrlToImage()
    }
    
    func getStudentSecondName() -> String {
        return student.getSecondName()
    }
    
    func getStudentGroupNuber() -> Int {
        return student.getGroupNumber()
    }
    
    func getStudentPhone() -> String {
        return student.getPhone()
    }
    
    func getStudentEmail() -> String {
        return student.getEmail()
    }
    
    func getStudentRecordBookNumber() -> String {
        return student.getNumberRecordBook()
    }
}
