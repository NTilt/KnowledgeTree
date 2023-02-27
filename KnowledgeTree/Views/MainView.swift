//
//  MainView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 13.01.2023.
//

import SwiftUI

struct MainView: View {
    @State var pageIndex: Int = 0
    @State var currentVertexName: String? = nil
    @EnvironmentObject var storage: Storage
    @StateObject var studentDocument: StudentDocument
    
    var body: some View {
        if pageIndex == 0 {
            KnowledgeTreeDocumentView(document: storage.getSubjectsBySection(by: "МОАИС"), studentDocument: studentDocument, pageIndex: $pageIndex, currentVertexName: $currentVertexName)
        }
    }
}

