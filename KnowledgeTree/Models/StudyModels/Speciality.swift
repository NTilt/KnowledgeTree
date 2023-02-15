//
//  Speciality.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import Foundation

enum DirectionsName {
    case MathematicalSupportAndAdministrationOfInformationSystems
    case SystemAnalysisAndManagement
    case FundamentalInformaticsAndInformationTechnology
    case PedagogicalEducation
    case InformaticsAndComputerEngineering
    case SoftwareEngineering
}

struct Speciality {
    private var nameOfDirection: DirectionsName
    private var descriptionNameOfDirection: String
    
    init(nameOfDirection: DirectionsName, descriptionNameOfDirection: String) {
        self.nameOfDirection = nameOfDirection
        self.descriptionNameOfDirection = descriptionNameOfDirection
    }
}
