//
//  CardAccountView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 04.04.2023.
//

import SwiftUI

struct CardAccountView: View {
    var student: Student
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .foregroundColor(Color("lectionRight"))
                                .frame(width: 66, height: 66, alignment: .center)
                            Image(systemName: "person.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                        }
                        .frame(width: 66, height: 66, alignment: .center)
                        
                        VStack(alignment: .leading) {
                            Text("\(student.getSecondName()) \(student.getName())")
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                            Text("\(student.getGroupNumber()) группа")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.footnote)
                        }
                        
                        Spacer()
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.7))
                    Text("Кафедра информатики и программирования")
                        .foregroundColor(.white)
                        .font(.title2.bold())
                    Label("Студент с 2019 года", systemImage: "calendar")
                        .foregroundColor(.white.opacity(0.7))
                        .font(.footnote)
                    Divider()
                        .background(Color.white.opacity(0.7))
                    
                    HStack(spacing: 16) {
                        Image(systemName: "link")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                        Text("ipsilon.sgu.ru")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.footnote)
                    }
                }
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.white.opacity(0.2))
                    .background(Color("lectionLeft").opacity(0.5))
                    .shadow(radius: 60, x: 0, y: 30)
                )
                .cornerRadius(30)
                .padding(.horizontal)
                
            }
        }
    }
}

struct CardAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CardAccountView(student: DataBase().studentNikita)
    }
}
