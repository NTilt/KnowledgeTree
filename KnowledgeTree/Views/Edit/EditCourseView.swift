//
//  EditCourseView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct EditCourseView: View {
    
    var course = courses[0]
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var model: AppModel
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack {
                overlayContent
                    .padding(.top, 60)
                    .shadow(color: .green.opacity(0.3), radius: 10, x: 0, y: 10)
                    .background(
                        Image("greenBlobs")
                            .resizable()
                            .frame(width: 700, height: 600)
                            .offset(x: 300, y: -50)
                    )
                    .offset(y: 40)
                Spacer()
            }
            .overlay {
                HStack {
                    buttonBack
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.leading, 60)
                    Spacer()
                }
                LiquidMenuButtons()
                    .offset(x: 0, y: 350)
            }
            
        }
        .navigationBarBackButtonHidden()
        
    }
    
    var buttonBack: some View {
        Button {
            dismiss()
            model.showDetail.toggle()
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
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            
            Text(course.text)
                .font(.footnote)
            
            
            Divider()
                .opacity(1)
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
            .opacity(1)
        }
            .padding(20)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
            )
            .padding(.horizontal, 20)
    }
}

struct EditCourseView_Previews: PreviewProvider {
    static var previews: some View {
        EditCourseView()
            .preferredColorScheme(.dark)
    }
}