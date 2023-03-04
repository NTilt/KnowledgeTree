//
//  ActivityNavigationBar.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ActivityNavigationBar: View {
    var title: String = "Активность"
    @Binding var hasScrolled: Bool
    @EnvironmentObject var appModel: AppModel
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            Text(title)
                .animatableFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ActivityNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ActivityNavigationBar(hasScrolled: .constant(true))
    }
}
