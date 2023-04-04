//
//  StudentRatingInfo.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 04.04.2023.
//

import SwiftUI

enum StudentInformation: String, CaseIterable, Identifiable {
    case personInfo = "Информация"
    case history = "История"
    case statistics = "Статистика"
    var id: Self { self }
}

struct StudentRatingInfo: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var student: Student
    @State var selectedItem: StudentInformation = .personInfo
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack(spacing: 50) {
                circleCourseRating
                    .padding(.top, 20)
                HStack {
                    totalRating
                        .padding(.leading, 70)
                    Spacer()
                    percentCourseDone
                        .padding(.trailing, 70)
                }
                Picker("Data", selection: $selectedItem) {
                    ForEach(StudentInformation.allCases) { item in
                        Text(item.rawValue)
                        }
                    }
                .pickerStyle(.segmented)
                .padding(.horizontal, 16)
                switch selectedItem {
                case .personInfo:
                    CardAccountView(student: student)
                case .history:
                    CardAccountView(student: student)
                case .statistics:
                    ChartView()
                }
                Spacer()
            }
            .overlay {
                buttonBack
                    .offset(x: -170, y: -380)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    var buttonBack: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            ZStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .frame(width: 36, height: 36)
                    .mask(Circle())
                    .padding(12)
                    .background(Color(UIColor.systemBackground).opacity(0.3))
                    .mask(Circle())
            }
                
        }
    }

    
    var percentCourseDone: some View {
        VStack {
            Text("\(70)%")
                .font(.system(size: 40))
            Text("Пройдено")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }
    }
    
    var totalRating: some View {
        VStack {
            Text("\(4)")
                .font(.system(size: 40))
            Text("Общий рейтинг")
                .font(.system(size: 15))
                .foregroundColor(.secondary)
        }
    }
    
    var circleCourseRating: some View {
        VStack {
            Text("\(251)")
                .font(.system(size: 50))
            Text("Баллы")
                .font(.title3)
                .foregroundColor(.secondary)
        }
            .foregroundColor(.white)
            .frame(width: 150, height: 150)
            .overlay {
                Circle()
                    .stroke(lineWidth: 10)
                    .foregroundColor(Color("lectionLeft"))
            }
            .overlay {
                CircularView(value: CGFloat(0.7), lineWidth: 10)
            }
            .aspectRatio(0.1, contentMode: .fit)
    }
}

struct StudentRatingInfo_Previews: PreviewProvider {
    static var previews: some View {
        StudentRatingInfo(student: DataBase().studentNikita)
    }
}
