//
//  ActivityResult.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 08.03.2023.
//

import Foundation

struct ActivityResult: Identifiable {
    var id: Int
    private var activity: ActivityType
    private var doneStudents: [Student]
    private var inProgressStudents: [Student]
    private var notStartedStudents: [Student]
    
    init(id: Int, activity: ActivityType, doneStudents: [Student], inProgressStudents: [Student], notStartedStudents: [Student]) {
        self.id = id
        self.activity = activity
        self.doneStudents = doneStudents
        self.inProgressStudents = inProgressStudents
        self.notStartedStudents = notStartedStudents
    }
    
    init(id: Int, activity: ActivityType) {
        self.id = id
        self.activity = activity
        self.doneStudents = []
        self.inProgressStudents = []
        self.notStartedStudents = []
    }
    
    func getProgressByStudent(by student: Student) -> StudyActivityProgress? {
        for doneStudent in doneStudents {
            if doneStudent == student {
                return .done
            }
        }
        
        for inProgressStudent in inProgressStudents {
            if inProgressStudent == student {
                return .inProgress
            }
        }
        
        for notStartedStudent in notStartedStudents {
            if notStartedStudent == student {
                return .notStarted
            }
        }
        
        return nil
    }
    
    func getActivity() -> ActivityType {
        return activity
    }
    
    func getDoneStudents() -> [Student] {
        return doneStudents
    }
    
    func getInProgressStudents() -> [Student] {
        return inProgressStudents
    }
    
    func getNotStartedStudents() -> [Student] {
        return notStartedStudents
    }
    
    mutating func addStudent(student: Student, studentProgress: StudyActivityProgress) {
        switch studentProgress {
        case .done:
            doneStudents.append(student)
        case .inProgress:
            inProgressStudents.append(student)
        case .notStarted:
            notStartedStudents.append(student)
        }
    }
}

struct ActivityResultModel {
    private var results = [ActivityResult]()
    private var uniqueId: Int
    
    init(courses: [Course]) {
        uniqueId = 0
        for course in courses {
            for section in course.sections {
                for activity in section.activities {
                    let result = ActivityResult(id: uniqueId, activity: activity)
                    results.append(result)
                    uniqueId += 1
                }
            }
        }
    }
    
    init(results: [ActivityResult] = [ActivityResult]()) {
        self.results = results
        self.uniqueId = results.isEmpty ? 0 : results.last!.id + 1
    }
    
    mutating func addStudentToActivityResult(student: Student, activity: ActivityType, studentProgress: StudyActivityProgress) {
        guard let result = getActivityResultByActivity(by: activity) else { return }
        guard let index = index(of: result) else { return }
        results[index].addStudent(student: student, studentProgress: studentProgress)
    }
    
    mutating func getAllNotStartedStudentsByActivity(by activity: ActivityType) -> [Student]? {
        guard let result = getActivityResultByActivity(by: activity) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].getNotStartedStudents()
    }
    
    mutating func getAllInProgressStudentsByActivity(by activity: ActivityType) -> [Student]? {
        guard let result = getActivityResultByActivity(by: activity) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].getInProgressStudents()
    }
        
    
    mutating func getAllDoneStudentByActivity(by activity: ActivityType) -> [Student]? {
        guard let result = getActivityResultByActivity(by: activity) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].getDoneStudents()
    }
    
    mutating func getActivityResultByActivity(by activity: ActivityType) -> ActivityResult? {
        for result in results {
            if result.getActivity() == activity {
                return result
            }
        }
        return nil
    }
    
    mutating func getActivityResultByStudent(by student: Student, activity: ActivityType) -> StudyActivityProgress? {
        guard let result = getActivityResultByActivity(by: activity) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].getProgressByStudent(by: student)
    }

    
    mutating func addActivityResult(activity: ActivityType,
                                    done doneStudents: [Student],
                                    inProgress inProgressStudents: [Student],
                                    notStarted notStartedStudents: [Student]) {
        let result = ActivityResult(id: uniqueId, activity: activity, doneStudents: doneStudents, inProgressStudents: inProgressStudents, notStartedStudents: notStartedStudents)
        uniqueId += 1
        results.append(result)
    }
    
    func index(of result: ActivityResult) -> Int? {
        for index in 0..<results.count {
            if results[index].id == result.id {
                return index
            }
        }
        return nil
    }
}
