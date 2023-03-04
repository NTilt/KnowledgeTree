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
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            button
        }
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code.")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()

            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions. SwiftUI makes it super easy to animate and add gestures to your app. The code is lightweight and easy to understand, even for newcomers who come from React or Flutter.")
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
    
    var button: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: 0)
        )
        .background(
            Image("sectionBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .offset(y: 0)
                .scaleEffect(1)
                .blur(radius: 10)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .offset(y: 0)
        )
        .overlay(
            overlayContent
                .offset(y: 0)
        )
        .frame(height: 500)
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Лекция 1")
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Лекция".uppercased())
                .font(.footnote.weight(.semibold))
            
            Text("90 минут")
                .font(.footnote)
            
            
            Divider()
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Created by Nikita")
                    .font(.footnote)
            }
        }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            )
            .offset(y: 250)
            .padding(20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(lection: lections[0], studentDocument: StudentDocument(student: DataBase().studentNikita))
    }
}
