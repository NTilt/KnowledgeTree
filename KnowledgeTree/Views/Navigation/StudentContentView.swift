//
//  StudentContentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct StudentContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("selectedTeacherTab") var selectedTeacherTab: TeacherTab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var appModel: AppModel
    @EnvironmentObject var storage: Storage
    @EnvironmentObject var dataBase: DataBase
    @StateObject var studentDocument: StudentDocument
    
    var body: some View {
        let userModel = UserModelView(email: appModel.email)
        ZStack(alignment: .bottom) {
                switch selectedTab {
                case .home:
                    StudentHomeView(studentDocument: studentDocument)
                case .study:
                    MainView(studentDocument: studentDocument)
                case .rating:
                    StudentHomeView(studentDocument: studentDocument)
                case .profile:
                    StudentAccountView(userModel: userModel)
                }
                TabBar()
                    .offset(y: appModel.showDetail ? 200 : 0)
                    .ignoresSafeArea()
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct StudentContentView_Previews: PreviewProvider {
    static var previews: some View {
        StudentContentView(studentDocument: StudentDocument(student: DataBase().studentNikita))
            .environmentObject(AppModel())
            .environmentObject(Storage())
    }
}

