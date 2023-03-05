//
//  EditButton.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct EditButton: View {
    @State var isActive = false
    var body: some View {
       Text("asd")
    }
}

struct EditShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.46024*width, y: 0.99797*height))
        path.addLine(to: CGPoint(x: 0.53976*width, y: 0.99797*height))
        path.addCurve(to: CGPoint(x: 0.59699*width, y: 0.94954*height), control1: CGPoint(x: 0.56903*width, y: 0.99797*height), control2: CGPoint(x: 0.59087*width, y: 0.97906*height))
        path.addLine(to: CGPoint(x: 0.61839*width, y: 0.85501*height))
        path.addCurve(to: CGPoint(x: 0.65553*width, y: 0.83933*height), control1: CGPoint(x: 0.6315*width, y: 0.85039*height), control2: CGPoint(x: 0.64417*width, y: 0.84486*height))
        path.addLine(to: CGPoint(x: 0.73373*width, y: 0.89006*height))
        path.addCurve(to: CGPoint(x: 0.80625*width, y: 0.88222*height), control1: CGPoint(x: 0.75776*width, y: 0.90573*height), control2: CGPoint(x: 0.78616*width, y: 0.90297*height))
        path.addLine(to: CGPoint(x: 0.86217*width, y: 0.82319*height))
        path.addCurve(to: CGPoint(x: 0.86917*width, y: 0.74572*height), control1: CGPoint(x: 0.88227*width, y: 0.80197*height), control2: CGPoint(x: 0.88489*width, y: 0.77062*height))
        path.addLine(to: CGPoint(x: 0.82155*width, y: 0.66363*height))
        path.addCurve(to: CGPoint(x: 0.83553*width, y: 0.62581*height), control1: CGPoint(x: 0.82679*width, y: 0.65118*height), control2: CGPoint(x: 0.83159*width, y: 0.63873*height))
        path.addLine(to: CGPoint(x: 0.92596*width, y: 0.60322*height))
        path.addCurve(to: CGPoint(x: 0.97139*width, y: 0.54281*height), control1: CGPoint(x: 0.95436*width, y: 0.59676*height), control2: CGPoint(x: 0.97139*width, y: 0.57371*height))
        path.addLine(to: CGPoint(x: 0.97139*width, y: 0.46026*height))
        path.addCurve(to: CGPoint(x: 0.92596*width, y: 0.40031*height), control1: CGPoint(x: 0.97139*width, y: 0.43028*height), control2: CGPoint(x: 0.95436*width, y: 0.40677*height))
        path.addLine(to: CGPoint(x: 0.8364*width, y: 0.37771*height))
        path.addCurve(to: CGPoint(x: 0.82242*width, y: 0.33944*height), control1: CGPoint(x: 0.83203*width, y: 0.36342*height), control2: CGPoint(x: 0.82679*width, y: 0.3505*height))
        path.addLine(to: CGPoint(x: 0.87004*width, y: 0.25597*height))
        path.addCurve(to: CGPoint(x: 0.86261*width, y: 0.17896*height), control1: CGPoint(x: 0.88577*width, y: 0.23014*height), control2: CGPoint(x: 0.88358*width, y: 0.20017*height))
        path.addLine(to: CGPoint(x: 0.80582*width, y: 0.11993*height))
        path.addCurve(to: CGPoint(x: 0.73548*width, y: 0.11117*height), control1: CGPoint(x: 0.78572*width, y: 0.10056*height), control2: CGPoint(x: 0.75995*width, y: 0.09687*height))
        path.addLine(to: CGPoint(x: 0.65553*width, y: 0.16328*height))
        path.addCurve(to: CGPoint(x: 0.61883*width, y: 0.14714*height), control1: CGPoint(x: 0.64417*width, y: 0.15728*height), control2: CGPoint(x: 0.63194*width, y: 0.15221*height))
        path.addLine(to: CGPoint(x: 0.59699*width, y: 0.05122*height))
        path.addCurve(to: CGPoint(x: 0.53976*width, y: 0.00279*height), control1: CGPoint(x: 0.59087*width, y: 0.0217*height), control2: CGPoint(x: 0.56903*width, y: 0.00279*height))
        path.addLine(to: CGPoint(x: 0.46024*width, y: 0.00279*height))
        path.addCurve(to: CGPoint(x: 0.40301*width, y: 0.05168*height), control1: CGPoint(x: 0.43097*width, y: 0.00279*height), control2: CGPoint(x: 0.40913*width, y: 0.0217*height))
        path.addLine(to: CGPoint(x: 0.3816*width, y: 0.14621*height))
        path.addCurve(to: CGPoint(x: 0.34403*width, y: 0.16281*height), control1: CGPoint(x: 0.3685*width, y: 0.15129*height), control2: CGPoint(x: 0.35539*width, y: 0.15636*height))
        path.addLine(to: CGPoint(x: 0.26452*width, y: 0.11117*height))
        path.addCurve(to: CGPoint(x: 0.19374*width, y: 0.11993*height), control1: CGPoint(x: 0.24005*width, y: 0.09687*height), control2: CGPoint(x: 0.21428*width, y: 0.1001*height))
        path.addLine(to: CGPoint(x: 0.13739*width, y: 0.17896*height))
        path.addCurve(to: CGPoint(x: 0.12996*width, y: 0.25597*height), control1: CGPoint(x: 0.11642*width, y: 0.20017*height), control2: CGPoint(x: 0.11423*width, y: 0.23014*height))
        path.addLine(to: CGPoint(x: 0.17758*width, y: 0.33944*height))
        path.addCurve(to: CGPoint(x: 0.1636*width, y: 0.37771*height), control1: CGPoint(x: 0.17321*width, y: 0.3505*height), control2: CGPoint(x: 0.16797*width, y: 0.36342*height))
        path.addLine(to: CGPoint(x: 0.07404*width, y: 0.40031*height))
        path.addCurve(to: CGPoint(x: 0.0286*width, y: 0.46026*height), control1: CGPoint(x: 0.04608*width, y: 0.40677*height), control2: CGPoint(x: 0.0286*width, y: 0.43028*height))
        path.addLine(to: CGPoint(x: 0.0286*width, y: 0.54281*height))
        path.addCurve(to: CGPoint(x: 0.07404*width, y: 0.60322*height), control1: CGPoint(x: 0.0286*width, y: 0.57371*height), control2: CGPoint(x: 0.04608*width, y: 0.59676*height))
        path.addLine(to: CGPoint(x: 0.16447*width, y: 0.62581*height))
        path.addCurve(to: CGPoint(x: 0.17845*width, y: 0.66363*height), control1: CGPoint(x: 0.16841*width, y: 0.63873*height), control2: CGPoint(x: 0.17321*width, y: 0.65118*height))
        path.addLine(to: CGPoint(x: 0.13083*width, y: 0.74572*height))
        path.addCurve(to: CGPoint(x: 0.13782*width, y: 0.82319*height), control1: CGPoint(x: 0.11511*width, y: 0.77062*height), control2: CGPoint(x: 0.11773*width, y: 0.80197*height))
        path.addLine(to: CGPoint(x: 0.19374*width, y: 0.88222*height))
        path.addCurve(to: CGPoint(x: 0.26627*width, y: 0.89006*height), control1: CGPoint(x: 0.21384*width, y: 0.90297*height), control2: CGPoint(x: 0.24224*width, y: 0.90573*height))
        path.addLine(to: CGPoint(x: 0.34447*width, y: 0.83933*height))
        path.addCurve(to: CGPoint(x: 0.3816*width, y: 0.85501*height), control1: CGPoint(x: 0.35583*width, y: 0.84486*height), control2: CGPoint(x: 0.3685*width, y: 0.85039*height))
        path.addLine(to: CGPoint(x: 0.40301*width, y: 0.94954*height))
        path.addCurve(to: CGPoint(x: 0.46024*width, y: 0.99797*height), control1: CGPoint(x: 0.40913*width, y: 0.97906*height), control2: CGPoint(x: 0.43097*width, y: 0.99797*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5*width, y: 0.6604*height))
        path.addCurve(to: CGPoint(x: 0.3484*width, y: 0.49992*height), control1: CGPoint(x: 0.41656*width, y: 0.6604*height), control2: CGPoint(x: 0.3484*width, y: 0.58846*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.34036*height), control1: CGPoint(x: 0.3484*width, y: 0.41276*height), control2: CGPoint(x: 0.41656*width, y: 0.34036*height))
        path.addCurve(to: CGPoint(x: 0.6516*width, y: 0.49992*height), control1: CGPoint(x: 0.58344*width, y: 0.34036*height), control2: CGPoint(x: 0.6516*width, y: 0.41276*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.6604*height), control1: CGPoint(x: 0.6516*width, y: 0.58846*height), control2: CGPoint(x: 0.58344*width, y: 0.6604*height))
        path.closeSubpath()
        return path
    }
}

struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton()
            .preferredColorScheme(.dark)
    }
}
