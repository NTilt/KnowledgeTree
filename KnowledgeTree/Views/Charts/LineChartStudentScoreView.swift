//
//  ChartsView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 11.05.2023.
//

import SwiftUI
import SwiftUICharts


struct LineChartStudentScoreView: View {
    var chartStyle: ChartStyle
    
    init() {
        
        let dark = ChartStyle(backgroundColor: Color.clear, accentColor: Color("lectionRight"), secondGradientColor: Color("topGreen"), textColor: Color.white, legendTextColor: Color.red, dropShadowColor: Color.red)
        self.chartStyle = dark
        self.chartStyle.darkModeStyle = dark
    }
    var body: some View {
        ZStack() {
            Color("Background").ignoresSafeArea(.all)
            LineView(data: [10, 20, 40, 100, 150, 200, 100, 120, 250, ], title: "Активность студента", legend: "Баллы", style: chartStyle, valueSpecifier: "%.0f", legendSpecifier: "%.0f")
                .padding(20)
                .offset(y: -45)
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartStudentScoreView()
    }
}
