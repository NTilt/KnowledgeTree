//
//  ButtonBack.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 02.03.2023.
//

import SwiftUI

struct ButtonBack: View {
    var body: some View {
        Button {
            
        } label: {
            BackShape()
                .fill(Color("buttonNext").opacity(0.8))
                .frame(width: 67, height: 62)
                .overlay(BackShape().stroke(.white))
                .background(
                    BackShape()
                        .fill(.angularGradient(colors: [.purple, .blue, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
                        .blur(radius: 12)
                )
                .offset(x: -4)
                .frame(width: 100, height: 100)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 46, style: .continuous))
                .strokeStyle(cornerRadius: 46)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
        }
        
    }
}

struct ButtonBack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBack()
    }
}

struct BackShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.02041*width, y: 0.61324*height))
        path.addLine(to: CGPoint(x: 0.3514*width, y: 0.97217*height))
        path.addCurve(to: CGPoint(x: 0.43244*width, y: 0.97742*height), control1: CGPoint(x: 0.37692*width, y: 1.00385*height), control2: CGPoint(x: 0.40692*width, y: 1.00918*height))
        path.addLine(to: CGPoint(x: 0.43244*width, y: 0.73541*height))
        path.addCurve(to: CGPoint(x: 0.44678*width, y: 0.73548*height), control1: CGPoint(x: 0.43851*width, y: 0.73548*height), control2: CGPoint(x: 0.44369*width, y: 0.73548*height))
        path.addCurve(to: CGPoint(x: 0.99949*width, y: 0.08562*height), control1: CGPoint(x: 0.75946*width, y: 0.73548*height), control2: CGPoint(x: 0.99949*width, y: 0.46016*height))
        path.addCurve(to: CGPoint(x: 0.93108*width, y: 0.04822*height), control1: CGPoint(x: 0.99949*width, y: -0.04481*height), control2: CGPoint(x: 0.9511*width, y: 0.00271*height))
        path.addCurve(to: CGPoint(x: 0.44438*width, y: 0.40963*height), control1: CGPoint(x: 0.83627*width, y: 0.26304*height), control2: CGPoint(x: 0.66155*width, y: 0.40963*height))
        path.addCurve(to: CGPoint(x: 0.43251*width, y: 0.40955*height), control1: CGPoint(x: 0.44179*width, y: 0.40963*height), control2: CGPoint(x: 0.43743*width, y: 0.40955*height))
        path.addLine(to: CGPoint(x: 0.43251*width, y: 0.17271*height))
        path.addCurve(to: CGPoint(x: 0.35146*width, y: 0.16745*height), control1: CGPoint(x: 0.40699*width, y: 0.14103*height), control2: CGPoint(x: 0.37383*width, y: 0.14481*height))
        path.addLine(to: CGPoint(x: 0.02047*width, y: 0.49841*height))
        path.addCurve(to: CGPoint(x: 0.02041*width, y: 0.61324*height), control1: CGPoint(x: -0.00511*width, y: 0.53009*height), control2: CGPoint(x: -0.00511*width, y: 0.58148*height))
        path.closeSubpath()
        return path
    }
}
