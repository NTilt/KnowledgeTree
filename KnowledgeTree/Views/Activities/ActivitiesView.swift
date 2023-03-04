//
//  ActivitiesView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State var hasScrolled = false
    @State var isLection: Bool = false
    @State var isPractice: Bool = false
    @State var lection: Lection = lections[0]
    @Binding var activities: [ActivityType]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                scrollDetection
                lectionSections
                    .padding([.top], 40)
            }
            
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay(content: {
                ActivityNavigationBar(hasScrolled: $hasScrolled)
            })
        }
        
    }
    
    var lectionSections: some View {
        LazyVGrid(columns: columns, spacing: 40) {
            ForEach(self.activities) { activity in
                ActivityItem(activity: activity)
                    .onTapGesture {
                        switch activity.type {
                        case .lection:
                            isLection = true
                            lection = activity as! Lection
                        case .laboratoryWork:
                            isPractice = true
                        case .testWork:
                            isPractice = true
                        case .practice:
                            isPractice = true
                        }
                    }
            }
        }
        .sheet(isPresented: $isLection) {
            SectionView(lection: $lection)
        }
        .sheet(isPresented: $isPractice) {
            TestView()
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView(activities: .constant(activities))
            .preferredColorScheme(.dark)
    }
}