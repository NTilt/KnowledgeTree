//
//  CustomError.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 15.02.2023.
//

import Foundation


protocol LocalizedError: Error {
    var errorDescription: String { get }
}

public enum AuthError: LocalizedError {
    
    var errorDescription: String {
        switch self {
        case .invalidEmail:
            return "Your email incorrect"
        case .invalidLogin:
            return "Your login incorrect"
        case .invalidPassword:
            return "Your password incorrect"
        case .emailFieldEmpty:
            return "Text field login is empty"
        case .passwordFieldEmpty:
            return "Text field password is empty"
        }
    }
    
    case invalidLogin
    case invalidPassword
    case invalidEmail
    case emailFieldEmpty
    case passwordFieldEmpty
}


