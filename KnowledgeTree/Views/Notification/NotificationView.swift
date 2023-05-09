//
//  NotificationView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 07.05.2023.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var studentDocument: StudentDocument
    
    var notifications: [any Notification] {
        studentDocument.studentsNotifications
    }
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea(.all)
            ScrollView {
                notificationsSection
            }
            .background(Image("Blob2"))
        }
    }
    
    var notificationsSection: some View {
        VStack(alignment: .leading) {
            ForEach(Array(notifications.enumerated()), id: \.offset) { index, notification in
                if index != 0 {Divider()}
                NotificationRow(notificationMessage: notification.sendNotification() as! NotificationMessage) {
                    studentDocument.removeNotificationByID(id: notification.id)
                }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
    }
}
