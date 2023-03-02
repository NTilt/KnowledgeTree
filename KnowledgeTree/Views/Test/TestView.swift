//
//  TestView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 01.03.2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                header
                    .padding(.bottom, 50)
                VStack(spacing: 50) {
                    TestCellView(text: "Вызывает компилятор")
                    TestCellView(text: "Показывает точку запуска программы")
                    TestCellView(text: "Завершает работу программы")
                    TestCellView(text: "Ничего не делает")
                }
                .padding([.leading, .trailing], 15)
                Divider()
                    .overlay(content: {
                        Color.purple
                    })
                    .padding([.leading, .trailing], 42)
                    .padding(.top, 50)
                HStack {
                    ButtonBack()
                        .padding([.top])
                        .padding(.leading, 40)
                    Spacer()
                    ButtonNext()
                        .padding([.top])
                        .padding(.trailing, 40)
                }
                Spacer()
            }
            .ignoresSafeArea()
            
        }
    }
    
    var currentQuestionNumber: some View {
        Text("1")
            .font(.title2)
            .frame(width: 36, height: 36)
            .cornerRadius(20)
            .padding(9)
            .overlay(content: {
                Circle()
                    .stroke(.white.opacity(0.3))
            })
            .overlay {
                CircularView(value: 0.1)
            }
//            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            //.strokeStyle(cornerRadius: 16)
    }
    
    var courseIcon: some View {
        Image("c++_icon")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 36, height: 36)
            .cornerRadius(20)
            .padding(9)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
            .strokeStyle(cornerRadius: 16)
    }
    
    var buttonBack: some View {
        Button {
            
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
    
    var header: some View {
        VStack(alignment: .leading) {
            Spacer()
            HStack {
                buttonBack
                    .padding(.leading)
                Spacer()
                currentQuestionNumber
                    .padding(.trailing, 8)
                courseIcon
                    .padding(.trailing)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Тест по С++")
                    .font(.footnote)
                Text("Что делает функция main?")
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Вопрос 1 из 20".uppercased())
                    .font(.footnote.weight(.semibold))
                
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
            )
        }
        .foregroundStyle(.white)
        .background(
            LinearGradient(colors: [Color("leftHeader"), Color("rightHeader")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .frame(height: 300)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .preferredColorScheme(.dark)
    }
}
