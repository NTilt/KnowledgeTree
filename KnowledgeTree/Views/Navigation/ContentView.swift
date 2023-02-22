//
//  ContentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @AppStorage("showModal") var showModal = false
    @EnvironmentObject var appModel: AppModel
    @State var pageIndex: Int = 0
    @State var currentVertexName: String? = nil
    @EnvironmentObject var storage: Storage
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:
                HomeView()
            case .study:
                MainView(storage: storage)
            case .rating:
                HomeView()
            case .profile:
                let studentModel = StudentModelView(email: appModel.email)
                AccountView(studentModel: studentModel)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
            .environmentObject(Storage())
    }
}

