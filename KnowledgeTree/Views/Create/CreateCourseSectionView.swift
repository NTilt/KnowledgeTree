//
//  CreateCourseSectionView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.06.2023.
//

import SwiftUI

struct CreateCourseSectionView: View {
    @Environment(\.dismiss) var dismiss
    var completion: () -> Void
    @Binding var sectionTitle: String
    @Binding var sectionSubTitle: String
    @Binding var time: String
    @Binding var position: String
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea(.all)
            VStack {
                VStack(alignment: .leading) {
                    Text("Введите название модуля:")
                        .font(.title3)
                    TextField("Введите", text: $sectionTitle)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Введите описание модуля:")
                        .font(.title3)
                    TextField("Введите", text: $sectionSubTitle)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Введите время изучения модуля:")
                        .font(.title3)
                    TextField("Введите", text: $time)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding()
                VStack(alignment: .leading) {
                    Text("Введите позицию модуля:")
                        .font(.title3)
                    TextField("Введите", text: $position)
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding()
                Button("Добавить") {
                    completion()
                    dismiss()
                }
            }
            
            
        }
        
        
        
    }
}

struct CreateCourseSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCourseSectionView(completion: {}, sectionTitle: .constant(""), sectionSubTitle: .constant(""), time: .constant(""), position: .constant(""))
    }
}
