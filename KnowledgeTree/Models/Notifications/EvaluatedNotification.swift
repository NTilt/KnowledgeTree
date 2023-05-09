//
//  EvaluatedNotification.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 09.05.2023.
//

import Foundation

struct NotificationMessage {
    var mainMessage: String
    var courseName: String?
    var sectionName: String?
    var activityName: String?
}

struct EmptyNotification: Notification {
    
    typealias Message = NotificationMessage
    typealias NotificationSubject = String
    
    var id = UUID()
    var mainMessage: String
    var notificationType: NotificationType
    var notificationFor: String
    
    func sendNotification() -> NotificationMessage {
        return NotificationMessage(mainMessage: mainMessage)
    }
}


struct WorkNotification: Notification {
    
    typealias Message = NotificationMessage
    typealias NotificationSubject = Student

    var id = UUID()
    var mainMessage: String
    var courseName: String
    var sectionName: String
    var activityName: String
    var notificationType: NotificationType
    var notificationFor: Student

    func sendNotification() -> Message {
        return NotificationMessage(mainMessage: mainMessage, courseName: courseName, sectionName: sectionName, activityName: activityName)
    }
}
