//
//  PieChartStudentWorksView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 12.05.2023.
//

import SwiftUI
import SwiftUICharts

struct PieChartStudentWorksView: View {
    var chartStyle: ChartStyle
    
    init() {
        let dark = ChartStyle(backgroundColor: Color.clear, accentColor: Color("lightGreen"), secondGradientColor: Color("lectionLeft"), textColor: Color.white, legendTextColor: Color.pink, dropShadowColor: Color.red)
        self.chartStyle = dark
        self.chartStyle.darkModeStyle = dark
    }
    var body: some View {
        ZStack() {
            Color("Background").ignoresSafeArea(.all)
            PieChartView(data: [20, 10], title: "Пирог", legend: "Legend", style: chartStyle, form: ChartForm.extraLarge, dropShadow: true)
        }
    }
}

struct PieChartStudentWorksView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartStudentWorksView()
    }
}
