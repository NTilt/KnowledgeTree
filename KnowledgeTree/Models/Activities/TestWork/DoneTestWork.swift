//
//  DoneTestWork.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.04.2023.
//

import Foundation

struct DoneTestWork: Identifiable {
    var id: UUID
    var answers: [Answers]
    var student: Student
    var courseID: UUID
    var sectionID: UUID
    var activityID: UUID
    
    init(answers: [Answers], student: Student, courseID: UUID, sectionID: UUID, activityID: UUID) {
        self.id = UUID()
        self.answers = answers
        self.student = student
        self.courseID = courseID
        self.sectionID = sectionID
        self.activityID = activityID
    }
}


struct DoneTestWorkModel {
    private var works = [DoneTestWork]()
    
    init(works: [DoneTestWork] = [DoneTestWork]()) {
        self.works = works
    }
    
    mutating func addDoneTestWork(answers: [Answers],
                                  student: Student,
                                  courseID: UUID,
                                  sectionID: UUID,
                                  activityID: UUID) {
        works.append(DoneTestWork(answers: answers, student: student, courseID: courseID, sectionID: sectionID, activityID: activityID))
    }
    
    func getAllWorks() -> [DoneTestWork] {
        return works
    }
    
    func getWorksForCourse(courseID: UUID) -> [DoneTestWork] {
        var worksForCourse: [DoneTestWork] = []
        for work in works {
            if work.courseID == courseID {
                worksForCourse.append(work)
            }
        }
        return worksForCourse
    }
    
    func getWorksForCourseSection(courseID: UUID, sectionID: UUID) -> [DoneTestWork] {
        var worksForCourseSection: [DoneTestWork] = []
        for work in works {
            if work.courseID == courseID && work.sectionID == sectionID {
                worksForCourseSection.append(work)
            }
        }
        return worksForCourseSection
    }
}
