//
//  EditTextFieldsView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 06.03.2023.
//

import SwiftUI

struct EditTextFieldsView: View {
    @State var courseTitle: String = "С++ для начинающих С++ для начинающих С++ для начинающих"
    
    var body: some View {
        
        TextEditor(text: $courseTitle)
            .textSelection(.enabled)
//        TextField("", text: $courseTitle)
//            //.textFieldStyle(.roundedBorder)
//            .lineLimit(4)
//            .padding()
//            .frame(width: 400, height: 160, alignment: .leading)
//
//            .background(.green)
    }
}

struct EditTextFieldsView_Previews: PreviewProvider {
    static var previews: some View {
        EditTextFieldsView()
    }
}
