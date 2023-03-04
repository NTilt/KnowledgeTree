//
//  CourseView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct CourseView: View {
    var course: Course
    var namespace: Namespace.ID
    @State var section = cPlusPlusSections[0]
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: AppModel
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    @State var showSection = false
    @StateObject var studentDocument: StudentDocument
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    cover
                    
                    content
                        .offset(y: 120)
                        .padding(.bottom, 200)
                        .opacity(appear[2] ? 1 : 0)
                }
                .coordinateSpace(name: "scroll")
                .onAppear {
                    model.showDetail = true
                }
//                .onDisappear {
//                    model.showDetail = false
//                }
                .background(Color("Background"))
                .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
                .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
                .scaleEffect(viewState.width / -500 + 1)
                .background(.black.opacity(viewState.width / 500))
                .background(.ultraThinMaterial)
                .gesture(isDraggable ? drag : nil)
                .ignoresSafeArea()
                
                button
            }
            .onAppear {
                fadeIn()
            }
            .onChange(of: show) { newValue in
                fadeOut()
            }
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation(.closeCard) {
                        viewState = value.translation
                    }
                    
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closeCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() {
        withAnimation(.closeCard.delay(0.3)) {
            show.toggle()
            model.showDetail.toggle()
        }
        withAnimation(.closeCard) {
            viewState = .zero
        }
        
        isDraggable = false
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(course.sections.enumerated()), id: \.offset) { index, section in
                if index != 0 { Divider() }
                let isOpen = studentDocument.isSectionOpenForCourse(for: course, section: section)
                SectionRow(section: section, isOpen: isOpen, studentDocument: studentDocument)
//                    .onTapGesture {
//                        if isOpen {
//                            self.section = section
//                            showSection = true
//                            model.currentSectionTitle = section.title
//                        }
//                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
//        .fullScreenCover(isPresented: $showSection) {
//            ActivitiesView(studentDocument: studentDocument)
//            //SectionView(section: courseSections[sectionIndex])
//        }
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                model.showDetail.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                Image(course.sectionImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)

    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            
            
            Divider()
                .opacity(appear[0] ? 1 : 0)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Created by Nikita")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(course: fullCourses[0], namespace: namespace, show: .constant(true), studentDocument: StudentDocument(student: DataBase().studentNikita))
            .environmentObject(AppModel())
    }
}

