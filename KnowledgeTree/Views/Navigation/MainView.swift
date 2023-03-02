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
        switch pageIndex {
        case 0:
            CourseKnowledgeSpaceView(document: storage.getSubjectsBySection(by: "МОАИС"), studentDocument: studentDocument, pageIndex: $pageIndex, currentVertexName: $currentVertexName)
        case 1:
            SectionKnowledgeSpaceView(pageIndex: $pageIndex, currentVertexName: currentVertexName!, document: storage.getSectionByCourseTitle(by: currentVertexName!), studentDocument: studentDocument)
        default:
            Color.clear
        }
    }
}

