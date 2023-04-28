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
    @Published private var courseResultModel: CourseResultModel
    @Published private(set) var sectionResultModel: SectionResultModel
    @Published private(set) var activityResultModel: ActivityResultModel
    @Published private(set) var doneTestWorks: DoneTestWorkModel
    @Published var groups: [StudyGroup] = []
    @Published var courses: [Course] = []
    @Published var fullProgramm: [StudyProgramm] = []
    @Published var students: [Student] = []
    var users: [User] = []
    
    
    init() {
        self.studyModel = StudyItemModel(studyItems: dataBase.getAllStudyItems())
        self.courseResultModel = CourseResultModel(results: dataBase.getAllCourseResults())
        self.sectionResultModel = SectionResultModel(courses: dataBase.getAllCourses())
        self.activityResultModel = ActivityResultModel(courses: dataBase.getAllCourses())
        self.doneTestWorks = DoneTestWorkModel()
        self.groups = dataBase.getAllGroups()
        self.fullProgramm = dataBase.getFullStudyProgramm()
        self.courses = dataBase.getAllCourses()
        self.users = dataBase.getAllUsers()
        self.students = dataBase.getAllStudents()
        
        for student in students {
            if let openCourses = getOpenCoursesForStudent(email: student.getEmail()) {
                for course in openCourses {
                    sectionResultModel.addStudentToSection(section: course.sections[0], student: student)
                }
            }
            
        }
    }
}

extension UniversityDocument {
    
    func getActivityByID(courseID: UUID, sectionID: UUID, activityID: UUID) -> ActivityType? {
        let activities = getActivitiesBySectionID(courseID: courseID, sectionID: sectionID)
        for activity in activities {
            if activity.getID() == activityID {
                return activity
            }
        }
        return nil
    }
    
    func getDoneTestWorksByCourseSection(courseID: UUID, sectionID: UUID) -> [DoneTestWork] {
        doneTestWorks.getWorksForCourseSection(courseID: courseID, sectionID: sectionID)
    }
    
    func getDoneTestWorksByCourse(courseID: UUID) -> [DoneTestWork] {
        doneTestWorks.getWorksForCourse(courseID: courseID)
    }
    
    func getAllDoneTestWorks() -> [DoneTestWork] {
        doneTestWorks.getAllWorks()
    }
    
    func addDoneTestWork(answers: [Answers], student: Student, courseID: UUID, sectionID: UUID, activityID: UUID) {
        doneTestWorks.addDoneTestWork(answers: answers, student: student, courseID: courseID, sectionID: sectionID, activityID: activityID)
    }
    
    func getSortedStudentsByParameters(courseTitle: String?, groupNumber: Int, sortedBy: Sorting) -> [Student] {
        var students = getStudentsByGroupNumber(by: groupNumber)
        switch sortedBy {
        case .byRating:
            break
        case .bySecondName:
            students = students.sorted(by: {
                $0.getSecondName() < $1.getSecondName()
            })
        }
        return students
    }
    
    
    func getStudentsByGroup(by group: StudyGroup) -> [Student] {
        group.getStudents()
    }
    
    func getNumberGroups(by courseTitle: String) -> [Int] {
        var listOfNumbers: [Int] = []
        if let course = getCourseByTitle(title: courseTitle) {
            listOfNumbers.append(contentsOf: getAllGroupsByCourse(by: course).map({$0.getGroupNumber()}))
        }
        return listOfNumbers
    }
    
    func getAllGroupsByCourse(by course: Course) -> [StudyGroup] {
        var groups: [StudyGroup] = []
        if let studyItem = studyModel.getItemByCourse(course: course){
            groups.append(contentsOf: studyItem.getListOfGroups())
        }
        return groups
    }
    
    func addStudentToCourse(student: Student, course: Course) {
        courseResultModel.addStudentToCourse(course: course, student: student)
    }
    
    func getSectionProgressForStudent(course: Course, sectionTitle: String, student: Student) -> Float {
        var activities: [ActivityType] = []
        for section in course.sections {
            if section.title == sectionTitle {
                activities.append(contentsOf: section.activities)
            }
        }
        let countDone = activityResultModel.getCountStudentDoneByActivities(activities: activities, student: student)
        return Float(countDone) / Float(activities.count)
    }
    
    func getActivitiesBySectionID(courseID: UUID, sectionID: UUID) -> [ActivityType] {
        guard let course = getCourseById(id: courseID) else { return [] }
        var activities: [ActivityType] = []
        for section in course.sections {
            if section.id == sectionID {
                activities = section.activities
            }
        }

        for activity in activities {
            activity.progress = .notStarted
        }
        
        return activities
    }
    
    func getStudentActivities(courseID: UUID, sectionID: UUID, student: Student) -> [ActivityType] {
        guard let course = getCourseById(id: courseID) else { return []}
        var activitiesOfSection: [ActivityType] = []
        for section in course.sections {
            if section.id == sectionID {
                activitiesOfSection.append(contentsOf: section.activities)
            }
        }
        
        for activity in activitiesOfSection {
            if let studentProgress = activityResultModel.getActivityResultByStudent(by: student, activity: activity) {
                activity.progress = studentProgress
            } else {
                activity.progress = .notStarted
            }
        }
        return activitiesOfSection
    }
    
    func getCourseById(id: UUID) -> Course? {
        for item in fullProgramm {
            if item.getCourse().id == id {
                return item.getCourse()
            }
        }
        return nil
    }
    
    func studentDoneActivity(activity: ActivityType, student: Student) {
        activityResultModel.addStudentToActivityResult(student: student, activity: activity, studentProgress: .done)
    }
    
    func studentDoneSection(courseTitle: String, sectionTitle: String, student: Student) {
        guard let course = getCourseByTitle(title: courseTitle) else { return }
        guard let sections = getSectionProgrammsByCourse(course: course) else { return }
        var sectionsForAppend: [CourseSection] = []
        for item in sections {
            if item.getSection().title == sectionTitle {
                sectionsForAppend.append(contentsOf: item.getChildsSections())
            }
        }
        for section in sectionsForAppend {
            sectionResultModel.addStudentToSection(section: section, student: student)
        }
        
    }
    
    func studentDoneCourse(courseTitle: String, student: Student) {
        let courses = getChildsCourseFromTitle(title: courseTitle)
        addStudentToCourses(student: student, courses: courses)
        for course in courses {
            sectionResultModel.addStudentToSection(section: course.sections[0], student: student)
        }
    }
    
    func addStudentToCourses(student: Student, courses: [Course]) {
        for course in courses {
            courseResultModel.addStudentToCourse(course: course, student: student)
        }
    }
    
    func getStudentByEmail(by email: String) -> Student? {
        for student in students {
            if student.getEmail() == email {
                return student
            }
        }
        return nil
    }
    
    func haveAccessStudentForSection(course: Course, section: CourseSection, student: Student) -> Bool {
        guard courseResultModel.checkStudentInCourse(student: student, course: course) != nil else { return false }
        guard let studentHaveAccessForSection = sectionResultModel.checkStudentInSection(student: student, section: section) else { return false }
        return studentHaveAccessForSection
    }
    
    func getOpenCoursesForStudent(email: String) -> [Course]? {
        guard let student = getStudentByEmail(by: email) else { return nil }
        let courses = courseResultModel.getAllOpenCoursesForStudent(for: student)
        return courses
    }
    
    func getCourseByTitle(title: String) -> Course? {
        for course in courses {
            if course.title == title {
                return course
            }
        }
        return nil
    }
    
    func changeCourseSectionInStudyItem(course: Course,
                                        section: CourseSection,
                                        title: String? = nil,
                                        subTitle: String? = nil,
                                        text: String? = nil) {
        studyModel.changeCourseSection(course: course, section: section, title: title, subTitle: subTitle, text: text)
        sectionResultModel.changeSection(section: section, title: title, subTitle: subTitle, text: text)
    }
    
    func changeCourseInStudyItem(course: Course,
                                 title: String? = nil,
                                 subTitle: String? = nil,
                                 text: String?  = nil) {
        if let item = studyModel.getItemByCourse(course: course) {
            studyModel.changeCourse(studyItem: item, title: title, subTitle: subTitle, text: text)
            courseResultModel.changeCourse(course: item.getCourse(), title: title, subTitle: subTitle, text: text)
        }
    }
    
    func getAllCoursesForStudent() -> [Course] {
        return studyModel.getAllCoursesForStudent()
    }
    
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
        return studyModel.getCoursesByTeacherEmail(by: teacher.getEmail())
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
