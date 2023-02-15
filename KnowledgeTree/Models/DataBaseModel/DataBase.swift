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
               urlToImage: "yasenikNikita",
               login: "NTilt"),
        
        Student(name: "Сергей",
                secondName: "Сергеев",
                thirdName: "Сергеевич",
                groupNumber: 121,
                email: "sergey@gmail.com",
                phone: "89999999119",
                numberRecordBook: "20191232",
                directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
               urlToImage: nil,
               login: "Sergey")
    ]
    
    private(set) var personSecurity: [UserSecurity] = [
        UserSecurity(login: "NTilt", password: "1234"),
        UserSecurity(login: "Sergey", password: "4321")
    ]
}

extension DataBase {
    
    func getStudentByLogin(by login: String) -> Student? {
        for student in students {
            if student.getLogin() == login {
                return student
            }
        }
        return nil
    }
    
    func getUserByLogin(by login: String) -> UserSecurity? {
        for user in personSecurity {
            if user.getLogin() == login {
                return user
            }
        }
        return nil
    }
    
    func getAllStudents() -> [Student] {
        return students
    }
    
    func getPasswordForUser(for login: String) -> String? {
        for userSecurity in personSecurity {
            if userSecurity.getLogin() == login {
                return userSecurity.getPassword()
            }
        }
        return nil
    }
    
    mutating func createStudent(
        name: String,
        secondName: String,
        thirdName: String?,
        groupNumber: Int,
        email: String,
        phone: String,
        numberRecordBook: String,
        directionOfStudy: DirectionsName,
        login: String
    ) {
        let student = Student(name: name,
                              secondName: secondName,
                              thirdName: thirdName,
                              groupNumber: groupNumber,
                              email: email,
                              phone: phone,
                              numberRecordBook: numberRecordBook,
                              directionOfStudy: directionOfStudy,
                              login: login)
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
