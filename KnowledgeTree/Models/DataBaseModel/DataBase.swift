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
                email: "yasenikns@sgu.ru",
                phone: "89999999999",
                numberRecordBook: "20192524",
                directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
               urlToImage: "yasenikNikita"),
        
        Student(name: "Сергей",
                secondName: "Сергеев",
                thirdName: "Сергеевич",
                groupNumber: 121,
                email: "sergeyaa@sgu.ru",
                phone: "89999999119",
                numberRecordBook: "20191232",
                directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
               urlToImage: nil)
    ]
    
    private(set) var personSecurity: [UserSecurity] = [
        UserSecurity(email: "yasenikns@sgu.ru", password: "1234", accessLevel: .student),
        UserSecurity(email: "sergeyaa@sgu.ru", password: "4321", accessLevel: .student),
        UserSecurity(email: "teacher", password: "12345", accessLevel: .teacher)
    ]
}

extension DataBase {
    
    func getUserAccessLevelBy(email: String) -> AccessLevel {
        for user in personSecurity {
            if user.getEmail() == email {
                return user.getAccessLevel()
            }
        }
        return .base
    }
    
    func isEmailCorrect(_ email: String) -> Bool {
        return email.contains("@sgu.ru") ? true : false
    }
    
    func isEmalAlreadyExists(_ email: String) -> Bool {
        for user in personSecurity {
            if user.getEmail() == email {
                return true
            }
        }
        return false
    }
    
    func getStudentByEmail(by email: String) -> Student? {
        for student in students {
            if student.getEmail() == email {
                return student
            }
        }
        return nil
    }
    
    func getUserByEmail(by email: String) -> UserSecurity? {
        for user in personSecurity {
            if user.getEmail() == email {
                return user
            }
        }
        return nil
    }
    
    func getAllStudents() -> [Student] {
        return students
    }
    
    func getPasswordForUser(for email: String) -> String? {
        for userSecurity in personSecurity {
            if userSecurity.getEmail() == email {
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
