//
//  StudentResultsView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 10.05.2023.
//

import SwiftUI

struct StudentResultsView: View {
    var work: EvaluatedTestWork
    @EnvironmentObject var universityDocument: UniversityDocument
//    var course: Course? {
//        universityDocument.getCourseById(id: work.courseID)
//    }
//    var activity: ActivityType? {
//        universityDocument.getActivityByID(courseID: work.courseID, sectionID: work.sectionID, activityID: work.activityID)
//    }
    @Binding var show: Bool
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 16) {
                            ZStack {
                                Image("math_icon")
                                    .resizable()
                                    .frame(width: 66, height: 66, alignment: .center)
                            }
                            .frame(width: 66, height: 66, alignment: .center)
                            
                            VStack(alignment: .leading) {
                                Text("Контрольная работа 3")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .bold()
                            }
                            
                            Spacer()
                        }
                        
                        Divider()
                            .background(Color.white.opacity(1))
                        Text("Доверительные интервалы")
                            .foregroundColor(.white)
                            .font(.title.bold())
                        Label("Балл: \(work.grade)", systemImage: "info.bubble")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.footnote)
                        
                        Divider()
                            .background(Color.white.opacity(1))
                    
                        HStack(alignment: .center) {
                            Spacer()
                            Button {
                                show = false
                            } label: {
                                Text("Закрыть")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                            }
                            .font(.headline)
                            .frame(width: 300, alignment: .center)
                            .blendMode(.overlay)
                            .buttonStyle(.testWork)
                            .tint(.accentColor)
                            .controlSize(.large)
                            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                            Spacer()
                        }
                        
                    }
                    .padding(16)
                    .background(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.2))
                        .background(Color("lectionLeft").opacity(1))
                        .shadow(radius: 60, x: 0, y: 30)
                    )
                    .cornerRadius(30)
                    .padding(.horizontal)
                }
                .overlay {
                    Button {
                        show = false
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .foregroundColor(.white)
                    }
                    .offset(x: 170, y: -130)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red.opacity(0.35))
        }
    }

}

struct StudentResultsView_Previews: PreviewProvider {
    static var previews: some View {
        StudentResultsView(work: EvaluatedTestWork(grade: 10, type: .rating, examiner: DataBase().teacherOlga, student: DataBase().studentNikita, courseID: UUID(), sectionID: UUID(), activityID: UUID()), show: .constant(true))
    }
}
