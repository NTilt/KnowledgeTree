//
//  StudyGroup.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 23.02.2023.
//

import Foundation


struct StudyGroup {
    
    private var groupNumber: Int
    private var students: [Student]
    
    init(groupNumber: Int, students: [Student]) {
        self.groupNumber = groupNumber
        self.students = students
    }
    
}

//Тут делать подписку на курс, то есть создается CourseProgress для конкретной группы

