//
//  TestWorkRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.04.2023.
//

import SwiftUI

struct TestWorkRow: View {
    var questionNumber: Int
    var question: String
    @Binding var arr: [Int: String]
    @State var answerForQuestion = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Вопрос \(questionNumber)")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom, 12)
            Text(question)
                .font(.headline)
            Divider()
            HStack {
                Text("Ответ: ")
                    .font(.title3)
                TextField("Введите ответ", text: $answerForQuestion, onEditingChanged: { end in
                    if !end {
                        arr[questionNumber] = answerForQuestion
                    }
                },
                          onCommit: {
                    arr[questionNumber] = answerForQuestion
                })
                    .font(.title3)
                    .fontWeight(.medium)
            }
        }
        .padding()
        
    }
}

struct TestWorkRow_Previews: PreviewProvider {
    static var previews: some View {
        TestWorkRow(questionNumber: 1, question: test3.listOfQuestions[0], arr: .constant([:]))
    }
}
