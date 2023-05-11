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
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
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
                }
                Button {
                    let teacher = universityDocument.getUserByEmail(by: model.email)! as! Teacher
                    let testWork = EvaluatedTestWork(grade: 10, type: .rating, examiner: teacher, student: studentWork.student, courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID)
                    universityDocument.addAnyEvaluated(testWork)
                    if let activity = universityDocument.getActivityByID(courseID: studentWork.courseID, sectionID: studentWork.sectionID, activityID: studentWork.activityID) {
                        universityDocument.studentDoneActivity(activity: activity, student: studentWork.student)
                    }
                    
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
        }
        
    }
    
}

struct ExaminationWorkView_Previews: PreviewProvider {
    static var previews: some View {
        ExaminationWorkView(studentWork: DoneTestWork(answers: [Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "1"), Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "2"),Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "3"), Answers(question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.", answer: "4")], student: DataBase().studentNikita, courseID: DataBase().courseSwift.id, sectionID: DataBase().courseSwift.sections[0].id, activityID: test3.id))
            .environmentObject(UniversityDocument())
    }
}
