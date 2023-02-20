//
//  AccountView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("isLogged") var isLogged = true
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLiteMode") var isLiteMode = true
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                
                menu
                
                Section {
                    Toggle(isOn: $isLiteMode) {
                        Label("Анимации", systemImage: isLiteMode ? "tortoise": "hare")
                            .foregroundColor(.primary)
                    }
                }
                
                webSites
                
                Button {
                    isLogged = false
                    dismiss()
                } label: {
                    Text("Выйти")
                }
                .tint(.red)
            }
            .navigationTitle("Аккаунт")
        }
    }
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.green, .green.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .foregroundColor(.green)
                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 200, y: 130)
                        .scaleEffect(0.6)
                )
            Text("Ясеник Никита")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Саратов")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: ContentView()) {
                Label("Настройки", systemImage: "gear")
            }
            Label("Помощь", systemImage: "questionmark")
        }
        .foregroundColor(.primary)
        .listRowSeparatorTint(.green)
        .listRowSeparator(.hidden)
    }
    
    var webSites: some View {
        Section {
            Link(destination: URL(string: "https://apple.com")!) {
                HStack {
                    Label("Ipsilon", systemImage: "globe")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
        }
        .foregroundColor(.primary)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

