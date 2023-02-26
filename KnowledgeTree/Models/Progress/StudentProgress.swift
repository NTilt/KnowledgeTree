//
//  StudentProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.02.2023.
//

import Foundation

/**
 StudentProgress необходимо для связи студента, и прогресса всех его модулей, которые он проходит;.
 */
struct StudentProgress {
    private var student: Student
    private var courseProgress: [CourseProgress]
}
