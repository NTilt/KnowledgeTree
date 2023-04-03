//
//  RatingNavigationBar.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 03.04.2023.
//

import SwiftUI

struct RatingNavigationBar: View {
    var title: String = "Рейтинг студентов"
    var completion: () -> Void
    @Binding var hasScrolled: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .animatableFont(size: hasScrolled ? 22 : 30, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            HStack(spacing: 13) {
                filterButton
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 40)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
            
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    var filterButton: some View {
        Button {
            completion()
        } label:{
            Image(systemName: "line.3.horizontal.decrease.circle")
                .font(.title2)
                .frame(width: 46, height: 46)
                .foregroundColor(.secondary)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            .strokeStyle(cornerRadius: 14)
        }
    }
}

struct RatingNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        RatingNavigationBar(completion: {print("Some filter")}, hasScrolled: .constant(false))
    }
}
