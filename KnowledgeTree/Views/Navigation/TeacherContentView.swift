//
//  TeacherContentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct TeacherContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("selectedTeacherTab") var selectedTeacherTab: TeacherTab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var appModel: AppModel
    @EnvironmentObject var storage: Storage
    @EnvironmentObject var dataBase: DataBase
    @StateObject var teacherDocument: TeacherDocument
    
    var body: some View {
        let userModel = UserModelView(email: appModel.email)
        ZStack(alignment: .bottom) {
                switch selectedTeacherTab {
                case .home:
                    TeacherHomeView(teacherDocument: teacherDocument)
                case .edit:
                    TeacherHomeView(teacherDocument: teacherDocument)
                case .rating:
                    TeacherHomeView(teacherDocument: teacherDocument)
                case .profile:
                    TeacherAccountView(userModel: userModel)
                }
                TeacherTabBar()
                    .offset(y: appModel.showDetail ? 200 : 0)
                    .ignoresSafeArea()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct TeacherContentView_Previews: PreviewProvider {
    static var previews: some View {
        TeacherContentView(teacherDocument: TeacherDocument(teacher: DataBase().teacherOlga))
            .environmentObject(AppModel())
            .environmentObject(Storage())
    }
}


