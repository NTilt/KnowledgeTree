//
//  ChartView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 04.04.2023.
//

import SwiftUI
import Charts
import SwiftUICharts

struct ChartView: View {
    let chartStyle = ChartStyle(backgroundColor: Color.purple, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: .purple )
    var body: some View {
        TabView {
            LineChartStudentScoreView()
            BarChartStudentCountWorksView()
//            Chart {
//                ForEach(data) { item in
//                    LineMark(
//                        x: .value("Category", item.category),
//                        y: .value("Value", item.value),
//                        series: .value("Year", "2022")
//                    )
//                    .foregroundStyle(by: .value("Year", "2022"))
//                    .symbol(by: .value("Year", "2022"))
//                    .interpolationMethod(.catmullRom)
//                }
//                ForEach(data2) { item in
//                    LineMark(
//                        x: .value("Category", item.category),
//                        y: .value("Value", item.value),
//                        series: .value("Year", "2021")
//                    )
//                    .cornerRadius(10)
//                    .foregroundStyle(by: .value("Year", "2021"))
//                    .symbol(by: .value("Year", "2021"))
//                    .interpolationMethod(.catmullRom)
//                }
//            }
//            .frame(width: 300, height: 300)
        }
        .tabViewStyle(.page)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Value: Identifiable {
    var id = UUID()
    var category: String
    var value: Double
}

let data = [
    Value(category: "Jun 1", value: 200),
    Value(category: "Jun 2", value: 96),
    Value(category: "Jun 3", value: 312),
    Value(category: "Jun 4", value: 256),
    Value(category: "Jun 5", value: 505),
]

let data2 = [
    Value(category: "Jun 1", value: 151),
    Value(category: "Jun 2", value: 192),
    Value(category: "Jun 3", value: 176),
    Value(category: "Jun 4", value: 158),
    Value(category: "Jun 5", value: 401),
]
