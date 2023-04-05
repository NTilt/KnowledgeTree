//
//  SectionEditView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 09.03.2023.
//

import SwiftUI

struct SectionEditView: View {
    var section: CourseSection
    var course: Course
    @EnvironmentObject var universityDocument: UniversityDocument
    @EnvironmentObject var model: AppModel
    @Environment(\.dismiss) var dismiss
    @State var sectionTitle: String
    @State var sectionSubTitle: String
    @State var sectionText: String
    @State var editTitle = false
    @State var editSubTitle = false
    @State var editText = false
    @FocusState var fieldIsFocused: Bool
    
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                overlayContent
                content
                    .offset(y: 50)
                Spacer()
            }
            
        }
        .overlay {
            HStack {
                buttonBack
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.leading, 60)
                Spacer()
            }
            SectionEditMenuButton(completionForSaveInfo: {
                universityDocument.changeCourseSectionInStudyItem(course: course, section: section, title: sectionTitle, subTitle: sectionSubTitle, text: sectionText)
                editText = false
                editTitle = false
                editSubTitle = false
                fieldIsFocused = false
            }, completionForEdit: {
                editText = true
                editTitle = true
                editSubTitle = true
            })
        }
        .onTapGesture(perform: {
            fieldIsFocused = false
        })
        .navigationBarBackButtonHidden()
    }
    
    var buttonBack: some View {
        Button {
            dismiss()
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
    
    var content: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(alignment: .center) {
                LazyHGrid(rows: rows, spacing: 30) {
                    ForEach(section.activities) { activity in
                        ActivityItem(activity: activity, studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()), completion: {})
                    }
                }
                .padding()
            }
        }
        .frame(width: 430, height: 260)
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            if editTitle {
                TextEditor(text: $sectionTitle)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .center)
                    .onLongPressGesture {
                        editTitle = false
                        universityDocument.changeCourseSectionInStudyItem(course: course, section: section, title: sectionTitle)
                    }
                    .focused($fieldIsFocused)
            }
            else {
                Text(sectionTitle)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onLongPressGesture {
                        editTitle = true
                    }
            }
            if editSubTitle {
                TextEditor(text: $sectionSubTitle)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.footnote.weight(.semibold))
                    .frame(maxWidth: .infinity, maxHeight: 20)
                    .onLongPressGesture {
                        editSubTitle = false
                        universityDocument.changeCourseSectionInStudyItem(course: course, section: section, subTitle: sectionSubTitle)
                    }
                    .focused($fieldIsFocused)
            }
            else {
                Text(sectionSubTitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .onLongPressGesture {
                        editSubTitle = true
                    }
            }
            if editText {
                TextEditor(text: $sectionText)
                    .foregroundColor(Color("topGreen").opacity(0.5))
                    .scrollContentBackground(.hidden)
                    .autocorrectionDisabled()
                    .font(.footnote)
                    .frame(maxWidth: .infinity, maxHeight: 30)
                    .onLongPressGesture {
                        editText = false
                        universityDocument.changeCourseSectionInStudyItem(course: course, section: section, text: sectionText)
                    }
                    .focused($fieldIsFocused)
            }
            else {
                Text(sectionText)
                    .font(.footnote)
                    .onLongPressGesture {
                        editText = true
                    }
            }
            
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            )
            .offset(y: 60)
            .padding(20)
    }
}

struct SectionEditView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        SectionEditView(section: section1, course: DataBase().courseSwift,
        sectionTitle: "123", sectionSubTitle: "123", sectionText: "123")
            .environmentObject(UniversityDocument())
            .environmentObject(AppModel())
    }
}
