//
//  ContentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("selectedTeacherTab") var selectedTeacherTab: TeacherTab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var appModel: AppModel
    @EnvironmentObject var storage: Storage
    @EnvironmentObject var dataBase: DataBase
    
    var body: some View {
        let userModel = UserModelView(email: appModel.email)
        let user = userModel.getUser()
        ZStack(alignment: .bottom) {
            if appModel.accessLevel == .teacher {
                switch selectedTeacherTab {
                case .home:
                    TeacherHomeView()
                case .edit:
                    TeacherHomeView()
                case .rating:
                    TeacherHomeView()
                case .profile:
                    TeacherAccountView(userModel: userModel)
                }
                TeacherTabBar()
                    .offset(y: appModel.showDetail ? 200 : 0)
                    .ignoresSafeArea()
            }
            else {
                switch selectedTab {
                case .home:
                    StudentHomeView(studentDocument: StudentDocument(student: user as! Student))
                case .study:
                    MainView()
                case .rating:
                    StudentHomeView(studentDocument: StudentDocument(student: user as! Student))
                case .profile:
                    StudentAccountView(userModel: userModel)
                }
                TabBar()
                    .offset(y: appModel.showDetail ? 200 : 0)
                    .ignoresSafeArea()
            }
            
        }
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 44)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
            .environmentObject(Storage())
    }
}

