//
//  UniversityDocument.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 26.02.2023.
//

import Foundation


class UniversityDocument: ObservableObject {
    
    @Published private(set) var studyModel: StudyItemModel
    @Published private(set) var dataBase = DataBase()
    
    init() {
        studyModel = StudyItemModel()
        for item in dataBase.getStudyItems() {
            studyModel.addStudyItem(item: item)
        }
    }
}

extension UniversityDocument {
    
    func getCoursesForGroup(groupNumber: Int) -> [Course] {
        return studyModel.getCoursesByGroup(by: groupNumber)
    }
    
    func getCoursesForTeacher(teacherEmail: String) -> [Course] {
        return studyModel.getCoursesByTeacherEmail(by: teacherEmail)
    }
}
