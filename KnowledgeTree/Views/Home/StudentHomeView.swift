//
//  HomeView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct StudentHomeView: View {
    
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showCourse = false
    @State var selectedIndex = 0
    @State var currentCourseTitle = ""
    @EnvironmentObject var model: AppModel
    @AppStorage("isLiteMode") var isLiteMode = true
    @StateObject var studentDocument: StudentDocument
    
    private var openCourses: [Course] {
        return studentDocument.getOpenCourses()
    }
    
    private var allCourses: [Course] {
        studentDocument.getAllCourses()
    }
    
    var body: some View {
        ZStack {
            
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                coursesView
                
                Text("Все курсы".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                if !show {
                    cards

                }
                else {
                    ForEach(allCourses) { course in
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
                NavigationBar(title: "Курсы", hasScrolled: $hasScrolled, studentDocument: studentDocument)
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
    
    var detail: some View {
        ForEach(allCourses) { course in
            if course.id == selectedID {
                CourseView(course: course, namespace: namespace, show: $show, studentDocument: studentDocument)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                    removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
    
    var cards: some View {
        ForEach(allCourses) { course in
            CourseItem(course: course, namespace: namespace, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
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
    
    var coursesView: some View {
        TabView {
            ForEach(Array(openCourses.enumerated()), id: \.offset) { index, course in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    FeaturedItem(course: course)
                        .padding(.vertical, 40)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 1, y: 1, z: 0))
                        .shadow(color: .green.opacity(isLiteMode ? 0.3 : 0), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX) / 40)
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .offset(x: 72, y: -90)
                                .offset(x: minX / 2)
                        )
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                model.showDetail.toggle()
                                showStatusBar = false
                                selectedID = course.id
                                model.currentCourseTitle = course.title
                            }
                    }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(
            Image("greenBlobs")
                .resizable()
                .frame(width: 700, height: 600)
                .offset(x: 300, y: -50)
        )
    }
}

struct StudentHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StudentHomeView(studentDocument: StudentDocument(student: DataBase().studentNikita))
            .environmentObject(AppModel())
    }
}
