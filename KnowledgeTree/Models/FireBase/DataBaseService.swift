//
//  DataBaseService.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.06.2023.
//

import Foundation
import FirebaseFirestore


class DataBaseService {
    
    static let shared = DataBaseService()
    private let db = Firestore.firestore()
    
    private var courseRef: CollectionReference {
        return db.collection("courses")
    }
    
    private init() { }
    
    
    func setCourse(course: CourseFireBase, completion: @escaping (Result<CourseFireBase, Error>) -> ()) {
        courseRef.document(course.id).setData(course.representation) { error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                completion(.success(course))
            }
        }
    }
    
    func updateCourse(course: CourseFireBase) {
        print(course.id)
        courseRef.document(course.id).updateData(["title": "С++"])
    }
}

