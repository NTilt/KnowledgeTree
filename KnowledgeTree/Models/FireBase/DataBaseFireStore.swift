//
//  DataBaseFireStore.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.06.2023.
//

import Foundation


class DataBaseFireStore {
    
    private var dataBase = DataBase()
    
    init() {
        DataBaseService.shared.setCourse(course: dataBase.courseCplusFireBase) { result in
            switch result {
            case .success(_):
                print("Успешно")
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
