//
//  LaboratoryWorkStudentView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.04.2023.
//

import SwiftUI

struct LaboratoryWorkStudentView: View {
    var work: TestWork
    var completion: () -> Void
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
                                    .clipShape(Circle())
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
                                completion()
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
                    .padding(.horizontal, 18)
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
                    .offset(x: 160, y: -120)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.yellow.opacity(0.35))
        }
    }
}

struct LaboratoryWorkStudentView_Previews: PreviewProvider {
    static var previews: some View {
        LaboratoryWorkStudentView(work: test2, completion: {}, show: .constant(true))
    }
}
