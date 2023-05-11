//
//  TestWorkStudentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.04.2023.
//

import SwiftUI

struct TestWorkStudentView: View {
    var testWork: TestWork
    @State var arr: [Int: String] = [:]
    @Binding var isStarted: Bool
    @EnvironmentObject var universityDocument: UniversityDocument
    @EnvironmentObject var model: AppModel
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        ForEach(Array(testWork.listOfQuestions.enumerated()), id: \.offset) { index, question in
                            TestWorkRow(questionNumber: index + 1, question: question, arr: $arr)
                        }
                    }
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .strokeStyle(cornerRadius: 30)
                    .padding(20)
                    Button {
                        var answers: [Answers] = []
                        let student = universityDocument.getStudentByEmail(by: model.email)
                        for key in 0..<testWork.listOfQuestions.count {
                            if arr[key + 1] != nil {
                                answers.append(Answers(question: testWork.listOfQuestions[key], answer: arr[key + 1]!))
                            }
                            else {
                                answers.append(Answers(question: testWork.listOfQuestions[key], answer: nil))
                            }
                            
                        }
                        universityDocument.addDoneTestWork(answers: answers, student: student!, courseID: model.currentCourseId, sectionID: model.currentSectionID, activityID: model.currentActivityId)
                        universityDocument.studentSendActivityForCheck(activity: testWork, student: student!)
                        isStarted = false
                    } label: {
                        Text("Завершить работу")
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
}

struct TestWorkStudentView_Previews: PreviewProvider {
    static var previews: some View {
        TestWorkStudentView(testWork: test2, isStarted: .constant(true))
            .environmentObject(UniversityDocument())
            .environmentObject(AppModel())
    }
}
