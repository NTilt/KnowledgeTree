//
//  TeacherCourseItem.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 07.03.2023.
//

import SwiftUI

struct TeacherCourseItem: View {
    @State var isActive = false
    var course: Course = DataBase().courseSwift
    @EnvironmentObject var model: AppModel
    var namespace: Namespace.ID
    @Binding var show: Bool
    var isEdit: Bool
    
    var body: some View {
        VStack {
            Spacer()
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
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
            )
            
        }
        .foregroundStyle(.white)
        .background(
            Image(course.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
        .overlay {
            if isEdit {
                HStack {
                    Spacer()
                    Button {
                        isActive = true
                        model.showDetail.toggle()
                    } label: {
                        EditShape()
                            .fill(Color("buttonNext").opacity(0.8))
                            .frame(width: 25, height: 25)
                            .overlay(EditShape().stroke(.white))
                            .background(
                                EditShape()
                                    .fill(.angularGradient(colors: [.purple, .blue, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                                    .blur(radius: 12)
                            )
                            .offset(x: 0)
                            .frame(width: 45, height: 45)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 46, style: .continuous))
                            .strokeStyle(cornerRadius: 46)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                    }
                    .background(
                        NavigationLink(destination: EditCourseView(course: course, courseTitle: course.title, courseSubTitle: course.subtitle, courseText: course.text), isActive: $isActive, label: {
                            EmptyView()
                        })
                    )
                        .padding(.bottom, 200)
                        .padding(.trailing, 40)
                }
            }
            
        }
    }
}

struct TeacherCourseItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        TeacherCourseItem(namespace: namespace, show: .constant(true), isEdit: true)
    }
}

