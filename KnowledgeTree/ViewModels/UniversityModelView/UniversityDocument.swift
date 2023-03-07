//
//  UniversityDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 26.02.2023.
//

import Foundation


class UniversityDocument: ObservableObject {
    
    private var dataBase = DataBase()
    
    @Published private(set) var studyModel: StudyItemModel
    @Published var groups: [StudyGroup] = []
    @Published var courses: [Course] = []
    @Published var studyItems: [StudyItem] = []
    @Published var fullProgramm: [StudyProgramm] = []
    @Published var students: [Student] = []
    var users: [User] = []
    
    
    init() {
        self.studyModel = StudyItemModel()
        self.groups = dataBase.getAllGroups()
        self.fullProgramm = dataBase.getFullStudyProgramm()
        self.courses = dataBase.getAllCourses()
        self.users = dataBase.getAllUsers()
        self.studyItems = dataBase.getAllStudyItems()
        self.students = dataBase.getAllStudents()
        for item in studyItems {
            studyModel.addStudyItem(item: item)
        }
        
    }
}

extension UniversityDocument {
    
    func getUserByEmail(by email: String) -> User? {
        for user in users {
            if user.getEmail() == email {
                return user
            }
        }
        return nil
    }
    
    func studentInBase(student: Student) -> Bool {
        let numberRecordBookNewStudent = student.getNumberRecordBook()
        for student in students {
            let numberRecordBookStudentInBase = student.getNumberRecordBook()
            if numberRecordBookStudentInBase == numberRecordBookNewStudent {
                return true
            }
        }
        return false
    }

    func getStudentByRecordBook(by numberRecordBook: String) -> Student? {
        for student in students {
            if student.getNumberRecordBook() == numberRecordBook {
                return student
            }

        }
        return nil
    }
    
    func getGroupNumberByEmail(email: String) -> Int? {
        for student in students {
            if student.getEmail() == email {
                return student.getGroupNumber()
            }
        }
        return nil
    }

    func getStudentsByGroupNumber(by number: Int) -> [Student] {
        var listOfStudents: [Student] = []
        for student in students {
            if student.getGroupNumber() == number {
                listOfStudents.append(student)
            }
        }
        return listOfStudents
    }
    
    func getCoursesByTeacher(teacher: Teacher) -> [Course] {
        var courses: [Course] = []
        for item in studyItems {
            if item.getTeachers().contains(teacher) {
                courses.append(item.getCourse())
            }
        }
        return courses
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
    
    func getChildsCourseFromTitle(title: String) -> [Course] {
        var courses: [Course] = []
        for courseProgramm in fullProgramm {
            if courseProgramm.getCourse().title == title {
                courses.append(contentsOf: courseProgramm.getCourseProgramm().getChildsCourses())
                }
            }
            return courses
    }
    
    func getCourseByTitle(title: String) -> Course? {
        for item in fullProgramm {
            if item.getCourse().title == title {
                return item.getCourse()
            }
        }
        return nil
    }
    
    func getSectionProgrammsByCourse(course: Course) -> [SectionProgramm]? {
        for item in fullProgramm {
            if item.getCourse() == course {
                return item.getSectionProgramms()
            }
        }
        return nil
    }
    
    func getProgrammForStudent(student: Student) -> [CourseProgramm] {
            // тут проверять направление студента и выдавать нужную ему программу
            // пока что программа для всех одна
            var courseProgramm: [CourseProgramm] = []
            for item in fullProgramm {
                courseProgramm.append(item.getCourseProgramm())
            }
            return courseProgramm
        }
    
    func getCourseProgramm() -> [CourseProgramm] {
        var courseProgramm: [CourseProgramm] = []
        for item in fullProgramm {
            courseProgramm.append(item.getCourseProgramm())
        }
        return courseProgramm
    }
    
    func getSectionProgrammByCourseTitle(by title: String) -> [SectionProgramm] {
        var sectionProgramm: [SectionProgramm] = []
        for item in fullProgramm {
            if item.getCourse().title == title {
                sectionProgramm.append(contentsOf: item.getSectionProgramms())
            }
        }
        return sectionProgramm
    }
    
    func getCoursesForGroup(groupNumber: Int) -> [Course] {
        return studyModel.getCoursesByGroup(by: groupNumber)
    }
    
    func getCoursesForTeacher(teacherEmail: String) -> [Course] {
        return studyModel.getCoursesByTeacherEmail(by: teacherEmail)
    }
}
