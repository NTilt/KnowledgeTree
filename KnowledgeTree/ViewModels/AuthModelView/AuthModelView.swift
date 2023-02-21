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

// MARK: for SignUP
extension AuthModelView {
    
    func signUp(inputEmail: String,
                inputPassword: String,
                completion: @escaping (Result<Bool, RegisterErorr>) -> Void) {
        
        guard inputEmail != "" else {
            completion(.failure(RegisterErorr.emailFieldEmpty))
            return
        }
        
        guard inputPassword != "" else {
            completion(.failure(RegisterErorr.passwordFieldEmpty))
            return
        }
        
        guard dataBase.isEmailCorrect(inputEmail) == true else {
            completion(.failure(RegisterErorr.emailDoesntMatchForSGU))
            return
        }
        
        guard dataBase.isEmalAlreadyExists(inputEmail) == false else {
            completion(.failure(RegisterErorr.emailAlreadyExists))
            return
        }
        
        completion(.success(true))
    }
    
}


// MARK: for SignIn
extension AuthModelView {
    
    func signIn(inputEmail: String,
                inputPassword: String,
                completion: @escaping (Result<Bool, AuthError>) -> Void) {
        
        guard inputEmail != "" else {
            completion(.failure(AuthError.emailFieldEmpty))
            return
        }
        
        guard inputPassword != "" else {
            completion(.failure(AuthError.passwordFieldEmpty))
            return
        }
        
        guard let user = dataBase.getUserByEmail(by: inputEmail) else {
            completion(.failure(AuthError.invalidEmail))
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
