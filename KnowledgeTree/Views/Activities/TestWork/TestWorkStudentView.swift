//
//  TestWorkStudentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 04.04.2023.
//

import SwiftUI

struct TestWorkStudentView: View {
    var work: TestWork = test3
    @Binding var show: Bool
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack(spacing: 16) {
                            ZStack {
                                Image(work.logo)
                                    .resizable()
                                    .frame(width: 66, height: 66, alignment: .center)
                            }
                            .frame(width: 66, height: 66, alignment: .center)
                            
                            VStack(alignment: .leading) {
                                Text(work.subtitle)
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .bold()
                                if work.executionTime != nil {
                                    Text("Время на выполнение: \(work.executionTime!) минут")
                                        .foregroundColor(.white.opacity(0.7))
                                        .font(.footnote)
                                }
                                else {
                                    Text("Время на выполнение: неограничено")
                                        .foregroundColor(.white.opacity(0.7))
                                        .font(.footnote)
                                }
                                
                            }
                            
                            Spacer()
                        }
                        
                        Divider()
                            .background(Color.white.opacity(1))
                        Text(work.title)
                            .foregroundColor(.white)
                            .font(.title.bold())
                        if work.maxScore != nil {
                            Label("Максимальный балл: \(work.maxScore!)", systemImage: "info.bubble")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.footnote)
                        }
                        else {
                            Label("Оценивается преподавателем", systemImage: "info.bubble")
                                .foregroundColor(.white.opacity(0.7))
                                .font(.footnote)
                        }
                        
                        Divider()
                            .background(Color.white.opacity(1))
                    
                        HStack(alignment: .center) {
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Приступить к выполнению")
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

struct TestWorkStudentView_Previews: PreviewProvider {
    static var previews: some View {
        TestWorkStudentView(show: .constant(true))
    }
}
