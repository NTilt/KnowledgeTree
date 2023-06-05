//
//  Storage.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import Foundation


class Storage: ObservableObject {
    
    @Published var sectionStorage: [String: KnowledgeTreeDocument] = [:]
    
    @Published var courseStorage: [String: KnowledgeTreeDocument] = [:]
    
    @Published var facultyStorage: [String: KnowledgeTreeDocument] = [:]
    
    @Published var groupNumber: Int? = 441
    
    var universityModel = UniversityDocument()
    
    init() {
        sectionStorage = createSectionStorageForAllCourses()
        facultyStorage = createFacultyStorage()
        courseStorage = createDocumentFromProgramm()
    }
    
    func updateSectionProgramm(programm: [StudyProgramm]) {
        var storage: [String: KnowledgeTreeDocument] = [:]
        var courseProgramm: [CourseProgramm] = []
        for item in programm {
            courseProgramm.append(item.getCourseProgramm())
        }
        print("update")
        for course in courseProgramm {
            let courseTitle = course.getCourse().title
            print("\(courseTitle)")
            let document = createSectionsByCourseTitle(by: courseTitle, programm: programm)
            print("-----------")
            storage[courseTitle] = document
        }
        self.sectionStorage = storage
    }
    
    func createDocumentFromProgramm() -> [String: KnowledgeTreeDocument] {
        let programm = universityModel.getCourseProgramm()
        var storage: [String: KnowledgeTreeDocument] = [:]
        var model = KnowledgeTreeModel()
        model.createVertexesFromCourseProgramm(programm: programm)
        let document = KnowledgeTreeDocument(model)
        storage["МОАИС"] = document
        return storage
    }
    
    func createSectionStorageForAllCourses() -> [String: KnowledgeTreeDocument] {
        var storage: [String: KnowledgeTreeDocument] = [:]
        let courseProgramm = universityModel.getCourseProgramm()
        for course in courseProgramm {
            let courseTitle = course.getCourse().title
            let document = createSectionsByCourseTitle(by: courseTitle)
            storage[courseTitle] = document
        }
        return storage
    }
    
    func createCoursesFromGroup(from group: Int) -> [String: KnowledgeTreeDocument] {
        var storage: [String: KnowledgeTreeDocument] = [:]
        let courses = universityModel.getCoursesForGroup(groupNumber: group)
        var model = KnowledgeTreeModel()
        model.createVertexesFromCourses(courses: courses)
        let document = KnowledgeTreeDocument(model)
        storage["МОАИС"] = document
        return storage
    }
    
    func createLectionStorage() -> [String: KnowledgeTreeDocument] {
        var storage: [String: KnowledgeTreeDocument] = [:]
        
        var model = KnowledgeTreeModel()
        model.addVertex(vertex: KnowledgeTreeModel.Vertex(isLocked: true, isDraw: true, location: (0, 0), size: 5, text: "Введение", id: 0, childList: [1, 2]))
        model.addVertex(lock: true, draw: false, 5, "Лекция 1", [3, 4])
        model.addVertex(lock: true, draw: false, 5, "Лекция 2", [5, 6])
        model.addVertex(lock: true, draw: false, 5, "Лекция 3", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 4", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 5", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 6", [])
        var document = KnowledgeTreeDocument(model)
        storage["Структуры и алгоритмы"] = document
        
        model = KnowledgeTreeModel()
        model.addVertex(vertex: KnowledgeTreeModel.Vertex(isLocked: true, isDraw: true, location: (0, 0), size: 5, text: "Введение", id: 0, childList: [1, 2, 3, 4, 5, 6]))
        model.addVertex(lock: true, draw: false, 5, "Лекция 1", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 2", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 3", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 4", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 5", [])
        model.addVertex(lock: true, draw: false, 5, "Лекция 6", [])
        document = KnowledgeTreeDocument(model)
        storage["Программирование на С++"] = document
        
        return storage
    }
    
    func createFacultyStorage() -> [String: KnowledgeTreeDocument] {
        var storage: [String: KnowledgeTreeDocument] = [:]
        
        var model = KnowledgeTreeModel()
        model.addVertex(vertex: KnowledgeTreeModel.Vertex(isLocked: true, isDraw: true, location: (0, 0), size: 5, text: "МОАИС", id: 0, childList: [1, 2, 3, 4, 5]))
        model.addVertex(lock: true, draw: false, 5, "ПИ", [])
        model.addVertex(lock: true, draw: false, 5, "ФИИТ", [])
        model.addVertex(lock: true, draw: false, 5, "ИВТ", [])
        model.addVertex(lock: true, draw: false, 5, "САУ", [])
        model.addVertex(lock: true, draw: false, 5, "ПО", [])
        let document = KnowledgeTreeDocument(model)
        storage["КНиИТ"] = document
        
        return storage
    }
    
    func createSectionStorage() -> [String: KnowledgeTreeDocument] {
        var storage: [String: KnowledgeTreeDocument] = [:]
        
        var model = KnowledgeTreeModel()
        model.addVertex(vertex: KnowledgeTreeModel.Vertex(isLocked: true, isDraw: true, location: (0, 0), size: 5, text: "Структуры и алгоритмы", id: 0, childList: [1, 2, 3]))
        model.addVertex(lock: true, draw: false, 5, "Программирование на С++", [])
        model.addVertex(lock: true, draw: false, 5, "Математический анализ", [4])
        model.addVertex(lock: true, draw: false, 5, "Алгебра и геометрия", [])
        model.addVertex(lock: true, draw: false, 5, "Машинное обучение и анализ данных", [])
        let document = KnowledgeTreeDocument(model)
        storage["МОАИС"] = document
        
        return storage
    }
    
    func getSectionByCourseTitle(by title: String) -> KnowledgeTreeDocument {
        return sectionStorage[title]!
    }
    
    func getSectionByFaculty(by faculty: String) -> KnowledgeTreeDocument {
        return facultyStorage[faculty]!
    }
    
    func getSubjectsBySection(by section: String) -> KnowledgeTreeDocument {
        return courseStorage[section]!
    }
    
    private func createSectionsByCourseTitle(by title: String, programm: [StudyProgramm]? = nil) -> KnowledgeTreeDocument {
        if programm != nil {
            var sections: [SectionProgramm] = []
            for item in programm! {
                if item.getCourse().title == title {
                    sections.append(contentsOf: item.getSectionProgramms())
                }
            }
            var model = KnowledgeTreeModel()
            model.createVertexesFromSectionProgramm(programm: sections)
            return KnowledgeTreeDocument(model)
        }
        else {
            let sectionProgramm = universityModel.getSectionProgrammByCourseTitle(by: title)
            var model = KnowledgeTreeModel()
            model.createVertexesFromSectionProgramm(programm: sectionProgramm)
            return KnowledgeTreeDocument(model)
        }
    }
    
    func update() {
        objectWillChange.send()
    }
    

}
