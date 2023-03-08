//
//  SectionView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct SectionView: View {
    
    @EnvironmentObject var model: AppModel
    var lection: Lection
    @StateObject var studentDocument: StudentDocument
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                previewLection
                    .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 10)
                    .padding(.bottom, 160)
                    .background(
                        Image("greenBlobs")
                            .resizable()
                            .frame(width: 700, height: 600)
                            .offset(x: 300, y: -50)
                    )
                content
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            .overlay {
                HStack {
                    buttonBack
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()
                        .padding(.top, 30)
                    Spacer()
                }
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color("Background"))
                        .frame(height: 35)
                        
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Введение")
                .font(.title).bold()

            Text("Язык программирования С++ представляет высокоуровневый компилируемый язык программирования общего назначения со статической типизацией, который подходит для создания самых различных приложений. На сегодняшний день С++ является одним из самых популярных и распространенных языков. С++ является мощным языком, унаследовав от Си богатые возможности по работе с памятью. Поэтому нередко С++ находит свое применение в системном программировании, в частности, при создании операционных систем, драйверов, различных утилит, антивирусов и т.д. К слову сказать, ОС Windows большей частью написана на С++. Но только системным программированием применение данного языка не ограничивается. С++ можно использовать в программах любого уровня, где важны скорость работы и производительность. Нередко он применяется для создания графических приложений, различных прикладных программ. Также особенно часто его используют для создания игр с богатой насыщенной визуализацией. Кроме того, в последнее время набирает ход мобильное направление, где С++ тоже нашел свое применение. И даже в веб-разработке также можно использовать С++ для создания веб-приложений или каких-то вспомогательных сервисов, которые обслуживают веб-приложения. В общем С++ - язык широкого пользования, на котором можно создавать практически любые виды программ.")
            buttonDone
        }
        .padding(20)
    }
    
    var buttonDone: some View {
        Button {
            studentDocument.doneActivity(courseTitle: model.currentCourseTitle, sectionTitle: model.currentSectionTitle, activityTitle: lection.title)
            dismiss()
        } label: {
            Text("Изучено")
                .font(.title2)
                .foregroundColor(.purple)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var previewLection: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            Image("c++_icon")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 26, height: 26)
                .cornerRadius(20)
                .padding(9)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                .strokeStyle(cornerRadius: 16)
            Text("Лекция 1")
                .font(.largeTitle.weight(.bold))
                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            //.fontWeight(.bold)
            Text("Лекция".uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Text("90 минут")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
        }
        .padding(.all, 20)
        .padding(.vertical, 20)
        .frame(height: 200)
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        //.cornerRadius(30)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                .blendMode(.overlay)
        )
        .padding(.horizontal, 20)
        .offset(y: 140)
    }
    
    var buttonBack: some View {
        Button {
            dismiss()
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
    
//    var cover: some View {
//        VStack {
//            overlayContent
//                .offset(y: 0)
//                .frame(height: 100)
//        }
//        .frame(maxWidth: .infinity)
//        .frame(height: 300)
//        .foregroundStyle(.black)
//    }
//
//    var overlayContent: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("Лекция 1")
//                .font(.largeTitle.weight(.bold))
//                .foregroundColor(Color("Background"))
//                .frame(maxWidth: .infinity, alignment: .leading)
//            Text("Лекция".uppercased())
//                .font(.footnote.weight(.semibold))
//                .foregroundColor(Color("Background"))
//
//            Text("90 минут")
//                .font(.footnote)
//                .foregroundColor(Color("Background"))
//
//
//            Divider()
//                .padding(.bottom, 1)
//                .overlay(content: {
//                    Color(.blue).opacity(0.7)
//                })
//            HStack {
//                Image("Avatar Default")
//                    .resizable()
//                    .frame(width: 36, height: 36)
//                    .cornerRadius(10)
//                    .padding(8)
//                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
//                    .strokeStyle(cornerRadius: 18)
//                Text("Created by Nikita")
//                    .font(.footnote)
//                    .foregroundColor(Color("Background"))
//            }
//        }
//        .foregroundColor(.white)
//            .padding(20)
//            .background(
//                Rectangle()
//                    .fill(LinearGradient(colors: [Color("lectionLeft"), Color("topGreen")], startPoint: .bottomLeading, endPoint: .topTrailing))
//                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
//            )
//            .offset(y: 40)
//            .padding(20)
//    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(lection: lections[0], studentDocument: StudentDocument(student: DataBase().studentNikita, universityDocument: UniversityDocument()))
            .preferredColorScheme(.dark)
    }
}
