//
//  Notification.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 07.05.2023.
//

import Foundation

enum NotificationType {
    case system
    case student
}

protocol Notification {
    associatedtype Message
    associatedtype NotificationSubject

    var id: UUID { get set }
    var notificationType: NotificationType { get set }
    var notificationFor: NotificationSubject { get set }
    func sendNotification() -> Message
}

struct AppNotificationCenter {
    private(set) var notifications: [any Notification] = []
    
    mutating func addNotification(notification: any Notification) {
        notifications.append(notification)
    }
    
    mutating func deleteNotificationByID(id: UUID) {
        notifications.removeAll { notification in
            notification.id == id
        }
    }
}

