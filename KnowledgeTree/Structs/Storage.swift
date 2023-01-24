//
//  Storage.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import Foundation


class Storage: ObservableObject {
    
    // String - название предмета, Document - список лекций у этого предмета
    @Published var lectionStorage: [String: KnowledgeTreeDocument] = [:]
    
    // String - Название направления, Document - список предметов на направлении
    @Published var sectionStorage: [String: KnowledgeTreeDocument] = [:]
    
    //String - Название факультета, Document - список направлений на факультете
    @Published var facultyStorage: [String: KnowledgeTreeDocument] = [:]
    
    init() {
        lectionStorage = createLectionStorage()
        facultyStorage = createFacultyStorage()
        sectionStorage = createSectionStorage()
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
        var document = KnowledgeTreeDocument(model)
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
        var document = KnowledgeTreeDocument(model)
        storage["МОАИС"] = document
        
        return storage
    }
    
    func getLectionByCourse(by course: String) -> KnowledgeTreeDocument {
        return lectionStorage[course]!
    }
    
    func getSectionByFaculty(by faculty: String) -> KnowledgeTreeDocument {
        return facultyStorage[faculty]!
    }
    
    func getSubjectsBySection(by section: String) -> KnowledgeTreeDocument {
        return sectionStorage[section]!
    }
    
    func update() {
        objectWillChange.send()
    }
    

}
