//
//  ActivitiesView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivitiesView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                lectionSections
                    .padding([.top], 40)
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(NavigationBar(title: "Активность", hasScrolled: .constant(true), studentDocument: StudentDocument(student: DataBase().studentNikita)))
            .background(Image("Blob2").offset(x: 200, y: -600))
            
        }
        
    }
    
    var lectionSections: some View {
        LazyVGrid(columns: columns, spacing: 40) {
            ForEach(lections) { lection in
                LectionItem(lection: lection)
            }
        }
//        VStack(alignment: .leading, spacing: 56) {
//            HStack(alignment: .top, spacing: 16) {
//                LectionItem(lection: lections[0])
//                LectionItem(lection: lections[1])
//            }
//        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
            .preferredColorScheme(.dark)
    }
}
