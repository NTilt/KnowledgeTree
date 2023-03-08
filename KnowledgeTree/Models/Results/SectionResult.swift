//
//  SectionResult.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 08.03.2023.
//

import Foundation

struct SectionResult: Identifiable {
    var id: Int
    private var section: CourseSection
    private var admittedStudents: [Student]
    
    init(id: Int, section: CourseSection, admittedStudents: [Student]) {
        self.id = id
        self.section = section
        self.admittedStudents = admittedStudents
    }
    
    mutating func addStudent(student: Student) {
        admittedStudents.append(student)
    }
    
    func getSection() -> CourseSection {
        return section
    }
    
    func getAdmittedStudents() -> [Student] {
        return admittedStudents
    }
    
    func studentIsAdmitted(student: Student) -> Bool {
        return admittedStudents.contains(where: {$0 == student})
    }
}

struct SectionResultModel {
    private var results = [SectionResult]()
    
    private var uniqueId: Int
    
    init(results: [SectionResult] = [SectionResult]()) {
        self.results = results
        uniqueId = self.results.isEmpty ? 0 : self.results.last!.id + 1
    }
    
    init(courses: [Course]) {
        uniqueId = 0
        for course in courses {
            for (index, section) in course.sections.enumerated() {
                let result = SectionResult(id: uniqueId, section: section, admittedStudents: [])
                uniqueId += 1
                results.append(result)
            }
        }
    }
}

extension SectionResultModel {
    
    func checkStudentInSection(student: Student, section: CourseSection) -> Bool? {
        guard let result = getResultsForSection(for: section) else { return nil }
        guard let index = index(of: result) else { return nil }
        return results[index].studentIsAdmitted(student: student)
        
    }
    
    func getAllOpenSectionsForStudent(for student: Student) -> [CourseSection] {
        var sections: [CourseSection] = []
        for result in results {
            if result.getAdmittedStudents().contains(where: {$0 == student}) {
                sections.append(result.getSection())
            }
        }
        return sections
    }
    
    mutating func addSectionResult(section: CourseSection, students: [Student]) {
        let result = SectionResult(id: uniqueId, section: section, admittedStudents: students)
        uniqueId += 1
        results.append(result)
    }
    
    func getAdmittedStudentsBySection(by section: CourseSection) -> [Student]? {
        if let result = getResultsForSection(for: section) {
            if let index = index(of: result) {
                return results[index].getAdmittedStudents()
            }
        }
        return nil
    }
    
    mutating func addStudentToSection(section: CourseSection, student: Student) {
        if let result = getResultsForSection(for: section) {
            if let indexResult = index(of: result) {
                results[indexResult].addStudent(student: student)
            }
        }
    }
    
    func getResultsForSection(for section: CourseSection) -> SectionResult? {
        for result in results {
            if result.getSection() == section {
                return result
            }
        }
        return nil
    }
    
    func index(of result: SectionResult) -> Int? {
        for index in 0..<results.count {
            if results[index].id == result.id {
                return index
            }
        }
        return nil
    }
}
