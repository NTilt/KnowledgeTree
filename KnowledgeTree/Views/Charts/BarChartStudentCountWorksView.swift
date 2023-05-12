//
//  BarChartStudentCountWorksView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 12.05.2023.
//

import SwiftUI
import SwiftUICharts

struct BarChartStudentCountWorksView: View {
    var chartStyle: ChartStyle
    
    init() {
        let dark = ChartStyle(backgroundColor: Color.clear, accentColor: Color("lightGreen"), secondGradientColor: Color("lectionLeft"), textColor: Color.white, legendTextColor: Color.pink, dropShadowColor: Color.red)
        self.chartStyle = dark
        self.chartStyle.darkModeStyle = dark
    }
    var body: some View {
        ZStack() {
            Color("Background").ignoresSafeArea(.all)
            BarChartView(data: ChartData(values: [("ПН", 20), ("ВТ", 60), ("СР", 40), ("ЧТ", 15), ("ПТ", 40), ("СБ", 5), ("ВС", 80)]), title: "Время в приложении", legend: "Quarterly", style: chartStyle, form: ChartForm.extraLarge, cornerImage: Image(systemName: "clock.circle"), valueSpecifier: "%.0f мин")
        }
    }
}

struct BarChartStudentCountWorksView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartStudentCountWorksView()
    }
}
