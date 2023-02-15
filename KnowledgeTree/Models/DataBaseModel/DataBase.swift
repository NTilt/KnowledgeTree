//
//  DataBase.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

struct DataBase {
    
    private(set) var specialities: [Speciality] = [
        Speciality(nameOfDirection: .MathematicalSupportAndAdministrationOfInformationSystems,
                   descriptionNameOfDirection: "Математическое обеспечение и администрирование информационных систем")
    ]
    
    private(set) var students: [Student] = [
        Student(name: "Никита",
                secondName: "Ясеник",
                thirdName: "Сергеевич",
                groupNumber: 441,
                email: "nikitayasenik@gmail.com",
                phone: "89999999999",
                numberRecordBook: "20192524",
                directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
               urlToImage: "yasenikNikita")
    ]
}

extension DataBase {
    
    func getAllStudents() -> [Student] {
        return students
    }
    
    mutating func createStudent(
        name: String,
        secondName: String,
        thirdName: String?,
        groupNumber: Int,
        email: String,
        phone: String,
        numberRecordBook: String,
        directionOfStudy: DirectionsName
    ) {
        let student = Student(name: name,
                              secondName: secondName,
                              thirdName: thirdName,
                              groupNumber: groupNumber,
                              email: email,
                              phone: phone,
                              numberRecordBook: numberRecordBook,
                              directionOfStudy: directionOfStudy)
        guard studentInBase(student: student) == false else {
            return
        }
        students.append(student)
        
    }
    
    func studentInBase(student: Student) -> Bool {
        let numberRecordBookNewStudent = student.getNumberRecordBook()
        for studentInBase in students {
            let numberRecordBookStudentInBase = studentInBase.getNumberRecordBook()
            if numberRecordBookStudentInBase == numberRecordBookNewStudent {
                return true
            }
        }
        return false
    }
    
    func getStudentByRecordBook(by numberRecordBook: String) -> Student? {
        for studentInBase in students {
            if studentInBase.getNumberRecordBook() == numberRecordBook {
                return studentInBase
            }
        }
        return nil
    }
}
