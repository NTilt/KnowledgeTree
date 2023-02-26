//
//  GroupProgress.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 26.02.2023.
//

import Foundation

/**
 У каждой группы будет отдельный список курсов, и соответственно прогресс по ним;
 */

struct GroupProgress {
    private var groupNumber: Int
    private var studentProgress: [StudentProgress]
}
