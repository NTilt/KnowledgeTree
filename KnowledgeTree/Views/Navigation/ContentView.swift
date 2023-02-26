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
    @State var pageIndex: Int = 0
    @State var currentVertexName: String? = nil
    @EnvironmentObject var storage: Storage
    
    var body: some View {
        let userModel = UserModelView(email: appModel.email)
        ZStack(alignment: .bottom) {
            if appModel.accessLevel == .teacher {
                switch selectedTeacherTab {
                case .home:
                    HomeView()
                case .edit:
                    HomeView()
                case .rating:
                    HomeView()
                case .profile:
                    AccountView(userModel: userModel)
                }
                TeacherTabBar()
                    .offset(y: appModel.showDetail ? 200 : 0)
                    .ignoresSafeArea()
            }
            else {
                switch selectedTab {
                case .home:
                    HomeView()
                case .study:
                    MainView(storage: storage)
                case .rating:
                    HomeView()
                case .profile:
                    AccountView(userModel: userModel)
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

