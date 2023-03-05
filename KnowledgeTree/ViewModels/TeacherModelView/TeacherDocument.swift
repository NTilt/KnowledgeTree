//
//  TeacherDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import Foundation


class TeacherDocument: UserDocument {
    
    @Published var teacher: Teacher
    
    init(teacher: Teacher) {
        self.teacher = teacher
        super.init(user: teacher as User)
    }
    
}
