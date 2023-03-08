//
//  DataBase.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

struct DataBase {
    
    // MARK: Specialities
    
    var specialities: [Speciality] = [
        Speciality(nameOfDirection: .MathematicalSupportAndAdministrationOfInformationSystems,
                   descriptionNameOfDirection: "Математическое обеспечение и администрирование информационных систем")
    ]
    
    // MARK: Students
    
    var studentNikita = Student(name: "Никита", secondName: "Ясеник", thirdName: "Сергеевич", groupNumber: 441,email: "yasenikns@sgu.ru", phone: "89999999999", numberRecordBook: "20192524", directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems, urlToImage: "yasenikNikita")
    
    var studentSergey = Student(name: "Сергей", secondName: "Сергеев", thirdName: "Сергеевич", groupNumber: 421, email: "sergeyaa@sgu.ru", phone: "89999999119", numberRecordBook: "20191232", directionOfStudy: .MathematicalSupportAndAdministrationOfInformationSystems, urlToImage: nil)
    
    private lazy var students: [Student] = [studentNikita, studentSergey]
    
    // MARK: Teachers
    
    var teacherOlga = Teacher(name: "Ольга", secondName: "Матвеева", email: "teacher@sgu.ru", phone: "1231123123", experience: 20)
    
    // MARK: Groups
    
    lazy var group441 = StudyGroup(groupNumber: 441, students: [self.studentNikita])
    lazy var group421 = StudyGroup(groupNumber: 421, students: [self.studentSergey])
    
    private lazy var allGroups: [StudyGroup] = [group421, group441]
    
    //MARK: StudyItems
    
    lazy var programmingSwift = StudyItem(course: courseSwift, teachers: [self.teacherOlga], listOfGroups: [group441, group421])
    lazy var programmingC = StudyItem(course: courseCplusPlus, teachers: [self.teacherOlga], listOfGroups: [group421])
    lazy var programmingJava = StudyItem(course: courseJava, teachers: [self.teacherOlga], listOfGroups: [group441])
    
    private lazy var allStudyItems: [StudyItem] = [programmingC, programmingJava, programmingSwift]
    
    private lazy var users: [User] = [
        self.studentNikita,
        self.studentSergey,
        self.teacherOlga,
    ]
    
    var personSecurity: [UserSecurity] = [
        UserSecurity(email: "yasenikns@sgu.ru", password: "1234", accessLevel: .student),
        UserSecurity(email: "sergeyaa@sgu.ru", password: "4321", accessLevel: .student),
        UserSecurity(email: "teacher@sgu.ru", password: "12345", accessLevel: .teacher)
    ]
    
    var courseMachineLearning = Course(title: "Машинное обучение и анализ данных", subtitle: "27 модулей - 44 часа", text: "Машинное обучение и анализ данных", image: "machineLearning_course", background: "Background 1", icon: "machineLearning_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1")

    var courseDataBase = Course(title: "Базы данных", subtitle: "14 модулей - 20 часов", text: "Базы данных", image: "database_course", background: "Background 12", icon: "database_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground12")

    var courseMath = Course(title: "Математический анализ", subtitle: "35 модулей - 55 часов", text: "Математический анализ", image: "math_course", background: "Background 6", icon: "math_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground6")

    var courseGeom = Course(title: "Алгебра и геометрия", subtitle: "40 модулей - 40 часов", text: "Алгебра и геометрия", image: "geom_course", background: "Background 9", icon: "geom_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground9")

    var courseCSharp = Course(title: "C# для начинающих", subtitle: "23 модуля - 18 часов", text: "Научитесь создавать простые консольные приложения на языке С++", image: "c#_course", background: "Background 1", icon: "c#_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground1")

    var courseJava = Course(title: "Java", subtitle: "14 модулей - 15 часов", text: "Познакомьтесь с языком Java и откройте для себя новые парадигмы программирования", image: "java_course", background: "Background 10", icon: "java_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground10")

    var courseSwift = Course(title: "SwiftUI", subtitle: "25 модулей - 25 часов", text: "Узнайте, как проектировать мобильные приложения под iOS", image: "swiftui_course", background: "Background 11", icon: "swiftui_icon", sections: cPlusPlusSections, sectionImage: "SectionBackground11")

    var courseCplusPlus = Course(
        title: "C++ для начинающих",
        subtitle: "20 модулей - 15 часов",
        text: "Научитесь создавать простые консольные приложения на языке С++",
        image: "c++_course",
        background: "Background 7",
        icon: "c++_icon",
        sections: cPlusPlusSections,
        sectionImage: "SectionBackground7"
    )
    
    private lazy var allCourses: [Course] = [
        
        courseCplusPlus,
        courseCSharp,
        courseGeom,
        courseMath,
        courseSwift,
        courseJava,
        courseDataBase,
        courseMachineLearning,
    ]
    
    private lazy var fullProgramm: [StudyProgramm] = [
        StudyProgramm(courseProgramm: CourseProgramm(course: courseCplusPlus,
                                                     childCourses: [
                                                      courseGeom,
                                                      courseCSharp,
                                                      courseSwift,
                                                      courseJava]),
                      sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseCSharp, childCourses: [courseDataBase], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseGeom, childCourses: [courseMath], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseMath, childCourses: [courseMachineLearning], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseSwift, childCourses: [], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseJava, childCourses: [], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseDataBase, childCourses: [], category: .advanced), sectionProgramm: sectionProgramm),
        StudyProgramm(courseProgramm: CourseProgramm(course: courseMachineLearning, childCourses: [], category: .advanced), sectionProgramm: sectionProgramm)
        
    ]
    //можно сделать автоматически из полной программы (при старте приложения)
    private lazy var courseResults: [CourseResult] = [
        CourseResult(id: 0, course: courseCplusPlus, admittedStudents: [studentNikita, studentSergey]),
        CourseResult(id: 1, course: courseSwift, admittedStudents: []),
        CourseResult(id: 2, course: courseGeom, admittedStudents: []),
        CourseResult(id: 3, course: courseMath, admittedStudents: []),
        CourseResult(id: 4, course: courseCSharp, admittedStudents: []),
        CourseResult(id: 5, course: courseMachineLearning, admittedStudents: []),
        CourseResult(id: 6, course: courseDataBase, admittedStudents: []),
        CourseResult(id: 7, course: courseJava, admittedStudents: [])
    ]
    
}

extension DataBase {
    
    mutating func getAllCourseResults() -> [CourseResult] {
        return courseResults
    }
    
    mutating func getAllGroups() -> [StudyGroup] {
        return self.allGroups
    }
    
    mutating func getAllStudyItems() -> [StudyItem] {
        return self.allStudyItems
    }
    
    mutating func getAllCourses() -> [Course] {
        return self.allCourses
    }
    
    mutating func getFullStudyProgramm() -> [StudyProgramm] {
        return self.fullProgramm
    }
    
    mutating func getAllStudents() -> [Student] {
        return self.students
    }
    
    mutating func getAllUsers() -> [User] {
        return self.users
    }
    
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
}
