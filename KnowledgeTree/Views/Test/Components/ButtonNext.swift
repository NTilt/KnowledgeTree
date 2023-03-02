//
//  ButtonNext.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ButtonNext: View {
    var body: some View {
        Button {
            
        } label: {
            NextShape()
                .fill(Color("buttonNext").opacity(0.8))
                .frame(width: 72, height: 72)
                .overlay(NextShape().stroke(.white))
                .background(
                    NextShape()
                        .fill(.angularGradient(colors: [.purple, .blue, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                        .blur(radius: 12)
                )
                .offset(x: 2)
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 46, style: .continuous))
                .strokeStyle(cornerRadius: 46)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        }
    }
}

struct ButtonNext_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNext()
    }
}

struct NextShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.91671*width, y: 0.38165*height))
        path.addLine(to: CGPoint(x: 0.60847*width, y: 0.10841*height))
        path.addCurve(to: CGPoint(x: 0.533*width, y: 0.10441*height), control1: CGPoint(x: 0.58471*width, y: 0.08429*height), control2: CGPoint(x: 0.55676*width, y: 0.08024*height))
        path.addLine(to: CGPoint(x: 0.533*width, y: 0.28865*height))
        path.addCurve(to: CGPoint(x: 0.51965*width, y: 0.28859*height), control1: CGPoint(x: 0.52735*width, y: 0.28859*height), control2: CGPoint(x: 0.52253*width, y: 0.28859*height))
        path.addCurve(to: CGPoint(x: 0.00494*width, y: 0.78329*height), control1: CGPoint(x: 0.22847*width, y: 0.28859*height), control2: CGPoint(x: 0.00494*width, y: 0.49818*height))
        path.addCurve(to: CGPoint(x: 0.06865*width, y: 0.81177*height), control1: CGPoint(x: 0.00494*width, y: 0.88259*height), control2: CGPoint(x: 0.05*width, y: 0.84641*height))
        path.addCurve(to: CGPoint(x: 0.52188*width, y: 0.53665*height), control1: CGPoint(x: 0.15694*width, y: 0.64824*height), control2: CGPoint(x: 0.31965*width, y: 0.53665*height))
        path.addCurve(to: CGPoint(x: 0.53294*width, y: 0.53671*height), control1: CGPoint(x: 0.52429*width, y: 0.53665*height), control2: CGPoint(x: 0.52835*width, y: 0.53671*height))
        path.addLine(to: CGPoint(x: 0.53294*width, y: 0.717*height))
        path.addCurve(to: CGPoint(x: 0.60841*width, y: 0.721*height), control1: CGPoint(x: 0.55671*width, y: 0.74112*height), control2: CGPoint(x: 0.58759*width, y: 0.73823*height))
        path.addLine(to: CGPoint(x: 0.91665*width, y: 0.46906*height))
        path.addCurve(to: CGPoint(x: 0.91671*width, y: 0.38165*height), control1: CGPoint(x: 0.94047*width, y: 0.44494*height), control2: CGPoint(x: 0.94047*width, y: 0.40582*height))
        path.closeSubpath()
        return path
    }
}
