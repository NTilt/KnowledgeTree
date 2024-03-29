//
//  EditCourseView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct EditCourseView: View {
    
    var course = DataBase().courseSwift
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var model: AppModel
    @EnvironmentObject var universityDocument: UniversityDocument
    @State var showEditSectionModal = false
    @State var courseTitle: String
    @State var courseSubTitle: String
    @State var courseText: String
    @State var editCourseTitle = false
    @State var editCourseSubTitle = false
    @State var editCourseText = false
    @FocusState var fieldIsFocused: Bool
    lazy var oldCourseTitle: String = courseTitle
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    overlayContent
                        .padding(.top, 60)
                        .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 10)
                        .background(
                            Image("greenBlobs")
                                .resizable()
                                .frame(width: 700, height: 600)
                                .offset(x: 300, y: -50)
                        )
                        .offset(y: 40)
                        .padding(.bottom, 60)
                    sectionView
                    Spacer()
                }
                .overlay {
                    HStack {
                        buttonBack
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.leading, 60)
                        Spacer()
                    }
                    LiquidMenuButtons(completionForSaveInfo: {
                        editCourseTitle = false
                        editCourseText = false
                        editCourseSubTitle = false
                        universityDocument.changeCourseInStudyItem(course: course, title: courseTitle, subTitle: courseSubTitle, text: courseText)
                    },
                                      completionForEdit: {
                        editCourseTitle = true
                        editCourseText = true
                        editCourseSubTitle = true
                    })
                    .offset(x: 0, y: 350)
                }
                
            }
            .onTapGesture {
                fieldIsFocused = false
            }
        }
        .navigationBarBackButtonHidden()
        
    }
    
    var sectionView: some View {
        TabView {
            ForEach(Array(course.sections.enumerated()), id: \.offset) { index, section in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    TeacherSectionRow(section: section, course: course)
                        .rotation3DEffect(.degrees(minX / -10), axis: (x: 1, y: 1, z: 0))
                        .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 10)
                        .blur(radius: abs(minX) / 40)
                        .onTapGesture {
                            showEditSectionModal = true
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 130)

    }
    
    var buttonBack: some View {
        Button {
            dismiss()
            model.showDetail.toggle()
        } label: {
            ZStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .mask(Circle())
                    .padding(12)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .mask(Circle())
            }
                
        }
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            if editCourseTitle {
                TextEditor(text: $courseTitle)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .onLongPressGesture {
                        editCourseTitle = false
                        universityDocument.changeCourseInStudyItem(course: course, title: courseTitle)
                    }
                    .focused($fieldIsFocused)
                    
            }
            else {
                Text(courseTitle)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onLongPressGesture {
                        editCourseTitle = true
                    }
            }
            
            if editCourseSubTitle {
                TextEditor(text: $courseSubTitle)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.footnote.weight(.semibold))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .onLongPressGesture {
                        universityDocument.changeCourseInStudyItem(course: course, subTitle: courseSubTitle)
                        editCourseSubTitle = false
                    }
                    .focused($fieldIsFocused)
            }
            else {
                Text(courseSubTitle)
                    .font(.footnote.weight(.semibold))
                    .onLongPressGesture {
                        editCourseSubTitle = true
                    }
            }
            if editCourseText {
                TextEditor(text: $courseText)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.footnote)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .onLongPressGesture {
                        universityDocument.changeCourseInStudyItem(course: course, text: courseText)
                        editCourseText = false
                        
                    }
                    .focused($fieldIsFocused)
            }
            else {
                Text(courseText)
                    .font(.footnote)
                    .onLongPressGesture {
                        editCourseText = true
                    }
            }
            
            
            
            Divider()
                .opacity(1)
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
            .opacity(1)
        }
            .padding(20)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
            )
            .padding(.horizontal, 20)
    }
}

struct EditCourseView_Previews: PreviewProvider {
    static var previews: some View {
        EditCourseView(courseTitle: "123", courseSubTitle: "123", courseText: "123")
            .preferredColorScheme(.dark)
    }
}
