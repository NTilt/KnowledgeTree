//
//  LaunchView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.01.2023.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack() {
            VStack() {
                LinearGradient(colors: [.red, .purple], startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Text("KnowledgeTree")
                            .font(Font.system(size: 46, weight: .bold))
                            .multilineTextAlignment(.center)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .shadow(radius: 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(colors: [Color("topGreen"), .green], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        
    }
}
    

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
