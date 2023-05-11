//
//  ExaminationWorkView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.04.2023.
//

import SwiftUI

struct ExaminationWorkView: View {
    var studentWork: DoneTestWork
    @EnvironmentObject var universityDocument: UniversityDocument
    @EnvironmentObject var model: AppModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var finalScore: String = ""
    @State var hasScrolled = false
    @Namespace var namespace
    var maxScore: Int {
        universityDocument.getMaxScoreForActivity(courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID) ?? 0
    }
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
                scrollDetection
                VStack {
                    VStack(spacing: 20) {
                        ForEach(Array(studentWork.answers.enumerated()),
                                id: \.offset) { index, answer  in
                            ExaminationWorkRow(questionNumber: index + 1, question: answer.question, answer: answer.answer)
                        }
                    }
                    .padding([.top, .bottom], 20)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .strokeStyle(cornerRadius: 30)
                    .padding(20)
                    HStack {
                        Text("Баллы (из \(maxScore)): ")
                            .font(.title2)
                        TextField("Количество баллов", text: $finalScore)
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                    .padding([.leading, .bottom], 30)
                }
                Button {
                    let teacher = universityDocument.getUserByEmail(by: model.email)! as! Teacher
                    let testWork = EvaluatedTestWork(grade: Int($finalScore.wrappedValue) ?? 0, type: .rating, examiner: teacher, student: studentWork.student, courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID)
                    universityDocument.addAnyEvaluated(testWork)
                    universityDocument.addScoreForStudent(for: studentWork.student, score: Int(finalScore) ?? 0)
                    if let activity = universityDocument.getActivityByID(courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID) {
                        universityDocument.studentDoneActivity(activity: activity, student: studentWork.student)
                    }
                    universityDocument.removeDoneWorkForStudent(for: studentWork.student, courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID)
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Проверить работу")
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
                
            }
            .padding(.top, 70)
            .overlay {
                overlayText
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
    
    var overlayText: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text("Доверительные интервалы")
                .animatableFont(size: hasScrolled ? 20 : 25, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ExaminationWorkView_Previews: PreviewProvider {
    static var previews: some View {
        ExaminationWorkView(studentWork: DoneTestWork(answers: [Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "1"), Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "2"),Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "3"), Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "4")], student: DataBase().studentNikita, courseID: DataBase().courseSwift.id, sectionID: DataBase().courseSwift.sections[0].id, activityID: test3.id))
            .environmentObject(UniversityDocument())
    }
}
