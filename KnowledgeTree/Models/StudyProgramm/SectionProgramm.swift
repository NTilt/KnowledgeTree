//
//  SectionProgramm.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.02.2023.
//

import Foundation


enum SectionCategory {
    case base
    case advanced
}


struct SectionProgramm {
    private var section: CourseSection
    private var childSections: [CourseSection]
    private var sectionCategory: SectionCategory
    
    
    init(section: CourseSection, childSections: [CourseSection]) {
        self.section = section
        self.childSections = childSections
        self.sectionCategory = .base
    }
    
    init(section: CourseSection, childSections: [CourseSection], category: SectionCategory) {
        self.section = section
        self.childSections = childSections
        self.sectionCategory = category
    }
}

extension SectionProgramm {
    
    func getSection() -> CourseSection {
        return section
    }
    
    func getChildsSections() -> [CourseSection] {
        return childSections
    }
    
    func getSectionCategory() -> SectionCategory {
        return sectionCategory
    }
}
