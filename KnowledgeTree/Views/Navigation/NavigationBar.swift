//
//  StudentNavigationBar.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//
import SwiftUI

struct StudentNavigationBar: View {
    var title: String = ""
    @Binding var hasScrolled: Bool
    @State var showSearch = false
    @State var showNotification = false
    @State var showAccount = false
    @EnvironmentObject var appModel: AppModel
    @AppStorage("showModal") var showModal = false
    @AppStorage("isLogged") var isLogged = false
    @StateObject var studentDocument: StudentDocument
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            HStack(spacing: 26) {
                notificationButton
                Button {
                    if isLogged {
                        showAccount = true
                    }
                    else {
                        withAnimation {
                            showModal = true
                        }
                    }
                    
                }
                    label: {
                        Image("Avatar Default")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .cornerRadius(10)
                            .padding(8)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                        .strokeStyle(cornerRadius: 18)
                    }
                    .sheet(isPresented: $showAccount) {
                        let userModel = UserModelView(email: appModel.email)
                        if appModel.getAccessLevel() == .student {
                            StudentAccountView(userModel: userModel)
                        }
                        else {
                            TeacherAccountView(userModel: userModel)
                        }
                    }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
            
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
        
    }
    
    var notificationButton: some View {
        Button {
            showNotification = true
        } label:{
            Image("NotificationImage")
                .font(.body.weight(.bold))
                .frame(width: 46, height: 46)
                .foregroundColor(.secondary)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .strokeStyle(cornerRadius: 14)
            .overlay(
                countNotification
                    .offset(x: 15, y: -18)
            )
        }
        .sheet(isPresented: $showNotification) {
            NotificationView(studentDocument: studentDocument)
        }
    }
    
    var countNotification: some View {
        ZStack {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.purple)
            Text("\(studentDocument.studentsNotifications.count)")
                .font(.caption2)
                .foregroundColor(.white)
        }
    }
    
    var searchButton: some View {
        Button {
            showSearch = true
        } label:{
            Image(systemName: "magnifyingglass")
                .font(.body.weight(.bold))
                .frame(width: 46, height: 46)
                .foregroundColor(.secondary)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .strokeStyle(cornerRadius: 14)
        }
        .sheet(isPresented: $showSearch) {
            SearchView(studentDocument: studentDocument)
        }
    }
}

struct StudentNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        StudentNavigationBar(title: "Курсы", hasScrolled: .constant(false), studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
    }
}
