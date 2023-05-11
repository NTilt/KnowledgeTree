//
//  EvaluatedWorkStore.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 09.05.2023.
//

import Foundation

struct EvaluatedWorkRepository {
    private(set) var works: [any Evaluated] = []
    
    mutating func addWork(work: any Evaluated) {
        self.works.append(work)
    }
    
    func getWorkForStudentByActivity(student: Student, courseID: UUID, sectionID: UUID, activityID: UUID) -> EvaluatedTestWork? {
        for work in works {
            if let testWork = work as? EvaluatedTestWork {
                if testWork.courseID == courseID, testWork.sectionID == sectionID, testWork.activityID == activityID, testWork.student == student {
                    return testWork
                }
            }
        }
        return nil
    }
}
