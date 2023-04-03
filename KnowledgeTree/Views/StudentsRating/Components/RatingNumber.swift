//
//  RatingNumber.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 03.04.2023.
//

import SwiftUI

struct RatingNumber: View {
    var ratingNumber: Int
    var body: some View {
        Text("\(ratingNumber)")
            .frame(width: 44, height: 44)
            .background(HexagonShape()
                .stroke(lineWidth: 3)
                .foregroundStyle(.linearGradient(colors: [Color("lectionLeft"), Color("topGreen")], startPoint: .topLeading, endPoint: .bottomTrailing))
            )

    }
}

struct RatingNumber_Previews: PreviewProvider {
    static var previews: some View {
        RatingNumber(ratingNumber: 1)
    }
}

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.03619*width, y: 0.5*height))
        path.addCurve(to: CGPoint(x: 0.03981*width, y: 0.3904*height), control1: CGPoint(x: 0.03619*width, y: 0.44292*height), control2: CGPoint(x: 0.03622*width, y: 0.41562*height))
        path.addCurve(to: CGPoint(x: 0.17499*width, y: 0.15626*height), control1: CGPoint(x: 0.05299*width, y: 0.29784*height), control2: CGPoint(x: 0.10142*width, y: 0.21396*height))
        path.addCurve(to: CGPoint(x: 0.26809*width, y: 0.09833*height), control1: CGPoint(x: 0.19503*width, y: 0.14054*height), control2: CGPoint(x: 0.21866*width, y: 0.12687*height))
        path.addCurve(to: CGPoint(x: 0.36482*width, y: 0.04666*height), control1: CGPoint(x: 0.31753*width, y: 0.06979*height), control2: CGPoint(x: 0.34119*width, y: 0.05616*height))
        path.addCurve(to: CGPoint(x: 0.63518*width, y: 0.04666*height), control1: CGPoint(x: 0.45157*width, y: 0.0118*height), control2: CGPoint(x: 0.54843*width, y: 0.0118*height))
        path.addCurve(to: CGPoint(x: 0.73191*width, y: 0.09833*height), control1: CGPoint(x: 0.65881*width, y: 0.05616*height), control2: CGPoint(x: 0.68247*width, y: 0.06979*height))
        path.addCurve(to: CGPoint(x: 0.82501*width, y: 0.15626*height), control1: CGPoint(x: 0.78134*width, y: 0.12687*height), control2: CGPoint(x: 0.80497*width, y: 0.14054*height))
        path.addCurve(to: CGPoint(x: 0.96019*width, y: 0.3904*height), control1: CGPoint(x: 0.89858*width, y: 0.21396*height), control2: CGPoint(x: 0.94701*width, y: 0.29784*height))
        path.addCurve(to: CGPoint(x: 0.96381*width, y: 0.5*height), control1: CGPoint(x: 0.96379*width, y: 0.41562*height), control2: CGPoint(x: 0.96381*width, y: 0.44292*height))
        path.addCurve(to: CGPoint(x: 0.96019*width, y: 0.6096*height), control1: CGPoint(x: 0.96381*width, y: 0.55708*height), control2: CGPoint(x: 0.96379*width, y: 0.58438*height))
        path.addCurve(to: CGPoint(x: 0.82501*width, y: 0.84374*height), control1: CGPoint(x: 0.94701*width, y: 0.70216*height), control2: CGPoint(x: 0.89858*width, y: 0.78604*height))
        path.addCurve(to: CGPoint(x: 0.73191*width, y: 0.90168*height), control1: CGPoint(x: 0.80497*width, y: 0.85946*height), control2: CGPoint(x: 0.78134*width, y: 0.87314*height))
        path.addCurve(to: CGPoint(x: 0.63518*width, y: 0.95334*height), control1: CGPoint(x: 0.68247*width, y: 0.93021*height), control2: CGPoint(x: 0.65881*width, y: 0.94384*height))
        path.addCurve(to: CGPoint(x: 0.36482*width, y: 0.95334*height), control1: CGPoint(x: 0.54843*width, y: 0.9882*height), control2: CGPoint(x: 0.45157*width, y: 0.9882*height))
        path.addCurve(to: CGPoint(x: 0.26809*width, y: 0.90168*height), control1: CGPoint(x: 0.34119*width, y: 0.94384*height), control2: CGPoint(x: 0.31753*width, y: 0.93021*height))
        path.addCurve(to: CGPoint(x: 0.17499*width, y: 0.84374*height), control1: CGPoint(x: 0.21866*width, y: 0.87314*height), control2: CGPoint(x: 0.19503*width, y: 0.85946*height))
        path.addCurve(to: CGPoint(x: 0.03981*width, y: 0.6096*height), control1: CGPoint(x: 0.10142*width, y: 0.78604*height), control2: CGPoint(x: 0.05299*width, y: 0.70216*height))
        path.addCurve(to: CGPoint(x: 0.03619*width, y: 0.5*height), control1: CGPoint(x: 0.03622*width, y: 0.58438*height), control2: CGPoint(x: 0.03619*width, y: 0.55708*height))
        path.closeSubpath()
        return path
    }
}

