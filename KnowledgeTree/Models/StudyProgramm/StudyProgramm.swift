//
//  StudyProgramm.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.02.2023.
//

import Foundation


struct StudyProgramm {
    
    private var courseProgramm: CourseProgramm
    private var sectionProgramm: [SectionProgramm]
    
    init(courseProgramm: CourseProgramm, sectionProgramm: [SectionProgramm]) {
        self.courseProgramm = courseProgramm
        self.sectionProgramm = sectionProgramm
    }
}

extension StudyProgramm {
    
    mutating func changeSectionProgramm(sections: [SectionProgramm]) {
        self.sectionProgramm = sections
    }
}

extension StudyProgramm {
    
    func getCourseProgramm() -> CourseProgramm {
        return courseProgramm
    }
    
    func getSectionProgramms() -> [SectionProgramm] {
        return sectionProgramm
    }
    
    func getCourse() -> Course {
        return courseProgramm.getCourse()
    }
    
    func getAllSections() -> [CourseSection] {
        return courseProgramm.getCourse().sections
    }
}
