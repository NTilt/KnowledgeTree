//
//  ActivityType.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import Foundation
import SwiftUI


enum StudyActivityType {
    case lection
    case laboratoryWork
    case testWork
    case practice
}


class ActivityType: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var type: StudyActivityType
    var image: String
    var color1: Color
    var color2: Color
    
    
    init(title: String, subtitle: String, image: String, type: StudyActivityType, color1: Color, color2: Color) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.type = type
        self.color1 = color1
        self.color2 = color2
    }
}

var activities: [ActivityType] = [
    lection1,
    test1,
    lection2,
    test2,
    work1,
    work2
]

var activities1: [ActivityType] = [
    lection2,
    work2
]

