//
//  AuthModelView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.02.2023.
//

import Foundation

class AuthModelView: ObservableObject {
    private var dataBase: DataBase
    
    init() {
        self.dataBase = DataBase()
    }
    
    init(dataBase: DataBase) {
        self.dataBase = dataBase
    }
}

extension AuthModelView {
    
    func checkInputData(inputLogin: String,
                        inputPassword: String,
                        completion: @escaping (Result<Bool, AuthError>) -> Void) {
        
        guard inputLogin != "" else {
            completion(.failure(AuthError.loginFieldEmpty))
            return
        }
        
        guard inputPassword != "" else {
            completion(.failure(AuthError.passwordFieldEmpty))
            return
        }
        
        guard let user = dataBase.getUserByLogin(by: inputLogin) else {
            completion(.failure(AuthError.invalidLogin))
            return
        }
        let password = user.getPassword()
        
        guard inputPassword == password else {
            completion(.failure(AuthError.invalidPassword))
            return
        }
        completion(.success(true))
    }
}
