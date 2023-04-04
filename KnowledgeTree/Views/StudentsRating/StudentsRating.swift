//
//  StudentsRating.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 03.04.2023.
//

import SwiftUI

struct StudentsRating: View {
    @State var hasScrolled = false
    @State var showFilter = false
    @State var selectedCourse: String = "SwiftUI"
    @State var selectedSort: Sorting = .byRating
    @State var selectedGroup: Int = 441
    @State var showDetails = false
    @State var opacityForDetail: Double = 1
    @Namespace var namespace
    @EnvironmentObject var universityDocument: UniversityDocument
    @State var students: [Student]
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background").ignoresSafeArea()
                ScrollView {
                    scrollDetection
                    content
                }
                .padding(.top, 70)
                .overlay(RatingNavigationBar(completion: {showFilter = true}, hasScrolled: $hasScrolled))
                .sheet(isPresented: $showFilter) {
                    FilterScreen(selectedCourse: $selectedCourse, selectedSort: $selectedSort, selectedGroup: $selectedGroup, completion: {
                        self.students = universityDocument.getSortedStudentsByParameters(courseTitle: selectedCourse, groupNumber: selectedGroup, sortedBy: selectedSort)
                    })
                        .presentationDetents([.medium])
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
    
    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(students.enumerated()), id: \.offset) { index, student in
                if index != 0 { Divider() }
                StudentRatingRow(student: student, ratingNumber: index + 1)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}



struct StudentsRating_Previews: PreviewProvider {
    static var previews: some View {
        StudentsRating(students: UniversityDocument().students)
            .environmentObject(UniversityDocument())
    }
}
