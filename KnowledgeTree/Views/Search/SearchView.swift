//
//  SearchView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var text = ""
    @State var show = false
    @Namespace var namespace
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("greenBlobs").offset(x: -100, y: -200)
                )
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Поиск")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $show) {
                CourseView(course: courses[selectedIndex], namespace: namespace, show: $show)
            }
        }
    }
    
    var content: some View {
        ForEach(Array(courses.enumerated()), id: \.offset) { index, course in
            if course.title.contains(text) || text == "" {
                if index != 0 { Divider() }
                Button {
                    show = true
                    selectedIndex = index
                } label: {
                    HStack(alignment: .top, spacing: 12) {
                        Image(course.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .background(Color("Background"))
                            .mask(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(course.title).bold()
                                .foregroundColor(.primary)
                            Text(course.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
