//
//  ActivitiesView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State var hasScrolled = false
    @State var showTestWork = false
    @State var showLabWork = false
    @State var startTestWork = false
    @State var startLabWork = false
    @State var showResults = false
    @EnvironmentObject var model: AppModel
    @ObservedObject var studentDocument: StudentDocument
    @EnvironmentObject var universityModel: UniversityDocument
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    
    private var activities: [ActivityType] {
        return universityModel.getStudentActivities(courseID: model.currentCourseId, sectionID: model.currentSectionID, student: studentDocument.student)
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background").ignoresSafeArea()
                ScrollView {
                    scrollDetection
                    lectionSections
                        .padding([.top], 40)
                }
                
                .safeAreaInset(edge: .top, content: {
                    Color.clear.frame(height: 70)
                })
                .overlay(content: {
                    ZStack{
                        Color.clear
                            .background(.ultraThinMaterial)
                            .blur(radius: 10)
                            .opacity(hasScrolled ? 1 : 0)
                        HStack {
                            buttonBack
                                .padding([.leading, .top])
                            Text("Активность")
                                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.trailing, 60)
                                .padding(.top, 15)
                                .offset(y: hasScrolled ? -4 : 0)
                        }
                        
                    }
                    .frame(height: hasScrolled ? 44 : 70)
                    .frame(maxHeight: .infinity, alignment: .top)
                })
                if showTestWork {
                    TestWorkPreview(work: universityModel.getActivityByID(courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId) as! TestWork, completion: {startTestWork = true; showTestWork = false;
                    }, show: $showTestWork)
                }
//                if showLabWork {
//                    LaboratoryWorkStudentView(work: universityModel.getActivityByID(courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId) as! TestWork, completion: {
//                        startLabWork = true; showLabWork = false
//                    }, show: $startLabWork)
//                }
                if startTestWork {
                    TestWorkStudentView(testWork: universityModel.getActivityByID(courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId) as! TestWork, isStarted: $startTestWork)
                }
//                if startLabWork {
//                    TestWorkStudentView(testWork: universityModel.getActivityByID(courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId) as! TestWork, isStarted: $startLabWork)
//                }
                if showResults {
                    if let evaluatedWork = universityModel.getEvaluatedWorkForStudentByActivityID(student: studentDocument.student, courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId) {
                        StudentResultsView(work: evaluatedWork, show: $showResults)
                    }
                }
            }
            .onAppear {
                studentDocument.objectWillChange.send()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    var lectionSections: some View {
        LazyVGrid(columns: columns, spacing: 40) {
            ForEach(universityModel.getStudentActivities(courseID: model.currentCourseId, sectionID: model.currentSectionID, student: studentDocument.student)) { activity in
                switch activity.type {
                case .lection:
                    ActivityItem(activity: activity, studentDocument: studentDocument, completion: {}, completionForDone: {})
                case .testWork, .practice:
                    ActivityItem(activity: activity, studentDocument: studentDocument, completion: {showTestWork = true}, completionForDone: {showResults = true})
                case .laboratoryWork:
                    ActivityItem(activity: activity, studentDocument: studentDocument, completion: {showLabWork = true}, completionForDone: {})
                }
            }
        }
    }
    
    var buttonBack: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
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

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
            .environmentObject(AppModel())
            .environmentObject(UniversityDocument())
            .preferredColorScheme(.dark)
    }
}
