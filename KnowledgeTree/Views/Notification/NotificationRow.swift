//
//  NotificationRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 07.05.2023.
//

import SwiftUI

struct NotificationRow: View {
    var notificationMessage: NotificationMessage
    var completion: () -> Void
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(notificationMessage.courseName ?? "clock")
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .background(Color(UIColor.systemBackground).opacity(0.3))
                .mask(Circle())
            VStack(alignment: .leading, spacing: 8) {
                Text(notificationMessage.mainMessage)
                    .font(.caption).fontWeight(.medium)
                    .foregroundColor(.green)
                Text(notificationMessage.sectionName ?? "")
                    .fontWeight(.semibold)
                Text(notificationMessage.activityName ?? "")
                    .font(.caption.weight(.medium))
                    .foregroundColor(.secondary)
            }
        }
        .padding(20)
        .onTapGesture {
            print("TTAP")
            completion()
        }
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow(notificationMessage: NotificationMessage(mainMessage: "Уведомление"), completion: {})
    }
}
