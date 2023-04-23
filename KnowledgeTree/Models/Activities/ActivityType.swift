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

enum StudyActivityProgress {
    case done
    case inProgress
    case notStarted
}


class ActivityType: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var type: StudyActivityType
    var image: String
    var progress: StudyActivityProgress
    
    
    init(title: String, subtitle: String, image: String, type: StudyActivityType, progress: StudyActivityProgress) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.type = type
        self.progress = progress
    }
    
    func done() {
        self.progress = .done
    }
}

extension ActivityType {
    static func == (lhs: ActivityType, rhs: ActivityType) -> Bool {
        return lhs.id == rhs.id
    }
}

var activities: [ActivityType] = [
    lection1,
    test3,
    lection2,
    test2,
    work1,
    work2
]

var activities1: [ActivityType] = [
    lection2,
    work2
]

