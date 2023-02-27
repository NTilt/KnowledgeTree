//
//  SectionProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.02.2023.
//

import Foundation

/**
 SectionProgress предназначена для хранения прогресса конкретного модуля. При создании подаётся курс, который в себе хранит какие-то модули, а далее автоматически создается необходимая структура для хранения прогресса.
 */
class SectionProgress: ObservableObject {
    private var sectionName: String
    private var progress: Float
    
    init(sectionName: String, progress: Float) {
        self.sectionName = sectionName
        self.progress = progress
    }
}

extension SectionProgress {
    
    func updateProgress(progress: Float) {
        self.progress = progress
    }
    
    func getSectionName() -> String {
        return sectionName
    }
    
}
