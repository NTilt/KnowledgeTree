//
//  MainTabBar.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.02.2023.
//

import SwiftUI

struct MainTabBar: View {
    
    var body: some View {
        let gradient = LinearGradient(colors: [.orange, .green],
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing)
        
        TabView {
            
            ZStack {
                gradient
                    .opacity(0.25)
                    .ignoresSafeArea()
            }
            .tabItem {
                VStack {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
                .font(.title)
            }
            Text("Второй экран")
                .tabItem {
                    VStack {
                        Image(systemName: "graduationcap.circle")
                        Text("Study")
                    }
                }
            
            Text("Третий экран")
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Profile")
                    }
                }
        }
        .onAppear()
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
