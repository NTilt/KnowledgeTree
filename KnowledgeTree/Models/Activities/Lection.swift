//
//  Lection.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import Foundation
import SwiftUI

struct Lection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var logo: String
    var image: String
    var color1: Color
    var color2: Color
    
}

var lections = [
    Lection(title: "Введение в язык", subtitle: "Лекция 1", logo: "c++_icon", image: "c++_course", color1: .purple, color2: .pink),
    Lection(title: "Ветвления", subtitle: "Лекция 2", logo: "c++_icon", image: "c++_course", color1: .teal, color2: .blue),
    Lection(title: "Введение в язык", subtitle: "Лекция 1", logo: "c++_icon", image: "c++_course", color1: .purple, color2: .pink),
    Lection(title: "Ветвления", subtitle: "Лекция 2", logo: "c++_icon", image: "c++_course", color1: .teal, color2: .blue),
    Lection(title: "Введение в язык", subtitle: "Лекция 1", logo: "c++_icon", image: "c++_course", color1: .purple, color2: .pink),
    Lection(title: "Ветвления", subtitle: "Лекция 2", logo: "c++_icon", image: "c++_course", color1: .teal, color2: .blue),
]
