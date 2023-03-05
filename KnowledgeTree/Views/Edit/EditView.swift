//
//  EditView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct EditView: View {
    
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var isActive = false
    @State var selectedID = UUID()
    @State var showCourse = false
    @State var selectedIndex = 0
    @EnvironmentObject var model: AppModel
    @StateObject var teacherDocument: TeacherDocument
    
    private var courses: [Course] {
        var courses: [Course] = []
        courses.append(contentsOf: teacherDocument.getTeacherCourses())
        return courses
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                
                ScrollView {
                    scrollDetection
                    
                    if !show {
                        cards
                        
                    }
                    else {
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 70)
                })
                .overlay {
                    NavigationBar(title: "Курсы", hasScrolled: $hasScrolled, userDocument: teacherDocument)
                }
                if show {
                    detail
                }
                
            }
            .statusBarHidden(!showStatusBar)
            .onChange(of: show) { newValue in
                withAnimation(.closeCard) {
                    if newValue {
                        showStatusBar = false
                    }
                    else {
                        showStatusBar = true
                    }
                }
                
            }
        }
    }
    
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                TeacherCourseView(course: course, namespace: namespace, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                    removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(course: course, namespace: namespace, show: $show, isEdit: true)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                        model.currentCourseTitle = course.title
                    }
                }
        }
    }
    
    
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(teacherDocument: TeacherDocument(teacher: DataBase().teacherOlga))
            .preferredColorScheme(.dark)
    }
}
