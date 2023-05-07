//
//  ExaminationWorkRow.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 28.04.2023.
//

import SwiftUI

struct ExaminationWorkRow: View {
    var questionNumber: Int
    var question: String
    var answer: String?
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Вопрос \(questionNumber)")
                    .font(.title2.weight(.bold))
                Text(question)
                    .font(.callout.weight(.regular))
            }
            .padding([.leading, .trailing], 20)
            Divider()
                .padding([.leading, .trailing], 20)
            HStack(spacing: 20) {
                Text("Ответ:")
                    .font(.title2.weight(.bold))
                Text(answer?.description ?? "Нет ответа")
                    .font(.callout)
                    .fontWeight(.regular)
                Spacer()
            }
            .padding([.leading, .trailing], 20)
        }
        
        
        
    }
}

struct ExaminationWorkRow_Previews: PreviewProvider {
    static var previews: some View {
        ExaminationWorkRow(questionNumber: 1, question: "Найти доверительный интервал для оценки математического ожидания a  нормального распределения с надежностью 0,95, зная выборочную среднюю = 75.12, объем выборки n = 121 и среднее квадратическое отклонение σ = 11.")
    }
}
