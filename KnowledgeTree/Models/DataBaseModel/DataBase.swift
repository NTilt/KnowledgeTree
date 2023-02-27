//
//  DataBase.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

class DataBase: ObservableObject {
    
    private(set) var specialities: [Speciality] = [
        Speciality(nameOfDirection: .MathematicalSupportAndAdministrationOfInformationSystems,
                   descriptionNameOfDirection: "Математическое обеспечение и администрирование информационных систем")
    ]
    
    var studentNikita = Student(name: "Никита",
                                        secondName: "Ясеник",
                                        thirdName: "Сергеевич",
                                        groupNumber: 441,
                                        email: "yasenikns@sgu.ru",
                                        phone: "89999999999",
                                        numberRecordBook: "20192524",
                                        directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
                                       urlToImage: "yasenikNikita")
    
    var studentSergey = Student(name: "Сергей",
                                        secondName: "Сергеев",
                                        thirdName: "Сергеевич",
                                        groupNumber: 421,
                                        email: "sergeyaa@sgu.ru",
                                        phone: "89999999119",
                                        numberRecordBook: "20191232",
                                        directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems,
                                       urlToImage: nil)
    
    private var teacherOlga = Teacher(name: "Ольга", secondName: "Матвеева", email: "teacher@sgu.ru", phone: "1231123123", experience: 20)
    
    private lazy var group441 = StudyGroup(groupNumber: 441, students: [self.studentNikita])
    private lazy var group421 = StudyGroup(groupNumber: 421, students: [self.studentSergey])
    
    
    private lazy var programmingSwift = StudyItem(course: courseSwift, teachers: [teacherOlga], listOfGroups: [group441, group421])
    private lazy var programmingC = StudyItem(course: courseCplusPlus, teachers: [teacherOlga], listOfGroups: [group421])
    private lazy var programmingJava = StudyItem(course: courseJava, teachers: [teacherOlga], listOfGroups: [group441])
    
    private lazy var studyItems: [StudyItem] = [
        programmingSwift,
        programmingC,
        programmingJava
    ]
    
    private lazy var users: [User] = [
        self.studentNikita,
        self.studentSergey,
        self.teacherOlga,
    ]
    
    private(set) var personSecurity: [UserSecurity] = [
        UserSecurity(email: "yasenikns@sgu.ru", password: "1234", accessLevel: .student),
        UserSecurity(email: "sergeyaa@sgu.ru", password: "4321", accessLevel: .student),
        UserSecurity(email: "teacher@sgu.ru", password: "12345", accessLevel: .teacher)
    ]
    
    private lazy var groups: [StudyGroup] = [
        self.group441,
        self.group421
    ]
    
    var fullProgramm: [CourseProgramm] = [
        CourseProgramm(course: courseCplusPlus,
                       childCourses: [
                        courseGeom,
                        courseCSharp,
                        courseSwift,
                        courseJava]),
        CourseProgramm(course: courseCSharp, childCourses: [courseDataBase], category: .advanced),
        CourseProgramm(course: courseGeom, childCourses: [courseMath], category: .advanced),
        CourseProgramm(course: courseMath, childCourses: [courseMachineLearning], category: .advanced),
        CourseProgramm(course: courseSwift, childCourses: [], category: .advanced),
        CourseProgramm(course: courseJava, childCourses: [], category: .advanced),
        CourseProgramm(course: courseDataBase, childCourses: [], category: .advanced),
        CourseProgramm(course: courseMachineLearning, childCourses: [], category: .advanced),
        
    ]
    
}

extension DataBase {
    
    func getCourseFromTitle(title: String) -> [Course] {
        var courses: [Course] = []
        for courseProgramm in fullProgramm {
            if courseProgramm.getCourse().title == title {
                courses.append(contentsOf: courseProgramm.getChildsCourses())
            }
        }
        return courses
    }
    
    func getProgrammForStudent(student: Student) -> [CourseProgramm] {
        // тут проверять направление студента и выдавать нужную ему программу
        // пока что программа для всех одна
        return fullProgramm
    }
    
    func getStudentsByGroup(by groupNumber: Int) -> [Student] {
        var students: [Student] = []
        for group in groups {
            if group.getGroupNumber() == groupNumber {
                students.append(contentsOf: group.getStudents())
            }
        }
        return students
    }
    
    func getGroupNumberByEmail(email: String) -> Int? {
        for user in users {
            if let student = user as? Student {
                if student.getEmail() == email {
                    return student.getGroupNumber()
                }
            }
        }
        return nil
    }
    
    func getStudyItems() -> [StudyItem] {
        return studyItems
    }
    
    func getStudentsByGroupNumber(by number: Int) -> [Student] {
        var listOfStudents: [Student] = []
        for user in users {
            if let student = user as? Student {
                if student.getGroupNumber() == number {
                    listOfStudents.append(student)
                }
            }
        }
        return listOfStudents
    }
    
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
    
    func getUserByEmail(by email: String) -> User? {
        for user in users {
            if user.getEmail() == email {
                return user
            }
        }
        return nil
    }
    
    func getUserSecurityByEmail(by email: String) -> UserSecurity? {
        for user in personSecurity {
            if user.getEmail() == email {
                return user
            }
        }
        return nil
    }
    
    func getPasswordForUser(for email: String) -> String? {
        for userSecurity in personSecurity {
            if userSecurity.getEmail() == email {
                return userSecurity.getPassword()
            }
        }
        return nil
    }
    
    func createStudent(
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
        users.append(student)
        
    }
    
    func studentInBase(student: Student) -> Bool {
        let numberRecordBookNewStudent = student.getNumberRecordBook()
        for studentInBase in users {
            if let student = studentInBase as? Student {
                let numberRecordBookStudentInBase = student.getNumberRecordBook()
                if numberRecordBookStudentInBase == numberRecordBookNewStudent {
                    return true
                }
            }
        }
        return false
    }
    
    func getStudentByRecordBook(by numberRecordBook: String) -> Student? {
        for studentInBase in users {
            if let student = studentInBase as? Student {
                if student.getNumberRecordBook() == numberRecordBook {
                    return student
                }
            }
            
        }
        return nil
    }
}
