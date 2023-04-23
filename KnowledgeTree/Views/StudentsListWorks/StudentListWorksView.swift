//
//  StudentListWorksView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.04.2023.
//

import SwiftUI

struct StudentListWorksView: View {
    var work: TestWork
    var body: some View {
        Text(work.text)
    }
}

struct StudentListWorksView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListWorksView(work: test3)
    }
}
