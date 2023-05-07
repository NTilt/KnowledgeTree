//
//  StudentListWorksView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.04.2023.
//

import SwiftUI

struct StudentListWorksView: View {
    var courseID: UUID
    var sectionID: UUID
    @State var hasScrolled = false
    @State var showFilter = false
    @Namespace var namespace
    @EnvironmentObject var universityDocument: UniversityDocument
    
    var studentsWorks: [DoneTestWork] {
        universityDocument.getDoneTestWorksByCourseSection(courseID: courseID, sectionID: sectionID)
//        [DoneTestWork(answers: [], student: DataBase().studentNikita, courseID: DataBase().courseSwift.id, sectionID: DataBase().courseSwift.sections[0].id, activityID: test3.id),
//         DoneTestWork(answers: [], student: DataBase().studentNikita, courseID: DataBase().courseSwift.id, sectionID: DataBase().courseSwift.sections[0].id, activityID: test3.id)]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                ScrollView {
                    scrollDetection
                    content
                }
                .padding(.top, 70)
                .overlay(RatingNavigationBar(title: "Готовые работы", completion: {showFilter = true}, hasScrolled: $hasScrolled))
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(studentsWorks.enumerated()), id: \.offset) { index, studentWork in
                if index != 0 {Divider()}
                StudentWorkRow(work: studentWork, number: index + 1)
            }
        }
        
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
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

struct StudentListWorksView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListWorksView(courseID: DataBase().courseSwift.getID(), sectionID: section1.id)
            .environmentObject(UniversityDocument())
    }
}
