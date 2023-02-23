//
//  TeacherTabBar.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 23.02.2023.
//

import SwiftUI

struct TeacherTabBar: View {
    @AppStorage("selectedTeacherTab") var selectedTeacherTab: TeacherTab = .home
    @State var color: Color = .teal
    
    var body: some View {
        HStack {
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(
            HStack {
                if selectedTeacherTab == .profile { Spacer() }
                if selectedTeacherTab == .edit { Spacer() }
                if selectedTeacherTab == .rating {
                    Spacer()
                    Spacer()
                }
                Circle().fill(color).frame(width: 88)
                if selectedTeacherTab == .home { Spacer() }
                if selectedTeacherTab == .edit {
                    Spacer()
                    Spacer()
                }
                if selectedTeacherTab == .rating { Spacer() }
            }
            .padding(.horizontal, 8)
        )
        .overlay(
            HStack {
                if selectedTeacherTab == .profile { Spacer() }
                if selectedTeacherTab == .edit { Spacer() }
                if selectedTeacherTab == .rating {
                    Spacer()
                    Spacer()
                }
                Rectangle()
                    .fill(color)
                    .frame(width: 30, height: 5)
                    .cornerRadius(3)
                    .frame(width: 88)
                    .frame(maxHeight: .infinity, alignment: .top)
                if selectedTeacherTab == .home { Spacer() }
                if selectedTeacherTab == .edit {
                    Spacer()
                    Spacer()
                }
                if selectedTeacherTab == .rating { Spacer() }
            }
            .padding(.horizontal, 8)
        )
        .strokeStyle(cornerRadius: 34)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var buttons: some View {
        ForEach(tabTeacherItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTeacherTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTeacherTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTeacherTab == item.tab ? .overlay : .normal)
        }
    }
}

struct TeacherTabBar_Previews: PreviewProvider {
    static var previews: some View {
        TeacherTabBar()
    }
}

