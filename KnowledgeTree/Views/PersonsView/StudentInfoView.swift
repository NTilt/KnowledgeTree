//
//  StudentInfoView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 14.02.2023.
//

import SwiftUI

struct StudentInfoView: View {
    
    var studentModel: StudentModelView
    
    var body: some View {
        let studentName = studentModel.getStudentName()
        let studentUrlToImage = studentModel.getStudentUrlToImage() ?? "default_person_image"
        let studentSecondName = studentModel.getStudentSecondName()
        let studentGroupNumber = studentModel.getStudentGroupNuber()
        let studentPhone = studentModel.getStudentPhone()
        let studentEmail = studentModel.getStudentEmail()
        let studentRecordBook = studentModel.getStudentRecordBookNumber()
        ZStack {
            LinearGradient(colors: [Color("topGreen"), .green], startPoint: .top, endPoint: .bottom)
                .opacity(0.4)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(studentUrlToImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .background(.white)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.green, lineWidth: 4)
                        }
                    VStack (alignment: .center){
                        Text(studentSecondName)
                            .font(.title3.bold())
                            .frame(width: 100, height: 30)
                        Text(studentName)
                            .font(.title3.bold())
                            .frame(width: 100, height: 30)
                        Text("Номер группы: \(studentGroupNumber)")
                            .font(.caption.bold())
                            .frame(width: 130, height: 30)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                }
                .frame(minWidth: 410, minHeight: 255, alignment: .leading)
                .fixedSize()
                VStack {
                    Text("Номер студенческого: \(studentRecordBook)")
                        .font(.custom("Roboto-Regular", size: 20))
                        .frame(width: 350, height: 40, alignment: .leading)
                    Text("Почта: \(studentEmail)")
                        .colorMultiply(.black)
                        .font(.custom("Roboto-Regular", size: 20))
                        .frame(width: 350, height: 40, alignment: .leading)
                    Text("Телефон: \(studentPhone)")
                        .colorMultiply(.black)
                        .font(.custom("Roboto-Regular", size: 20))
                        .frame(width: 350, height: 40, alignment: .leading)
                }
                .padding(EdgeInsets(top: -170, leading: 0, bottom: 0, trailing: 0))
                .frame(idealWidth: 410, idealHeight: 420)
                .fixedSize()
                HStack {
                    ZStack {
                        Rectangle()
                            .fill(.green.opacity(0.7))
                            .frame(width: 150, height: 150)
                        Text("Rating in group")
                            .font(.custom("Roboto-Regular", size: 19))
                            .frame(width: 130, height: 20, alignment: .top)
                            .padding(EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0))
                        Text("3")
                            .font(.custom("Roboto-Regular", size: 60))
                            .frame(width: 130, height: 80, alignment: .center)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0))
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(.green.opacity(0.7))
                            .frame(width: 150, height: 150)
                        Text("Overall Rating")
                            .font(.custom("Roboto-Regular", size: 19))
                            .frame(width: 130, height: 20, alignment: .top)
                            .padding(EdgeInsets(top: -60, leading: 0, bottom: 0, trailing: 0))
                        Text("36")
                            .font(.custom("Roboto-Regular", size: 60))
                            .frame(width: 130, height: 80, alignment: .center)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
                    
                
                }
                .frame(minWidth: 410)
            }
        }
        
    }
}

struct StudentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let studentModelView = StudentModelView(login: "NTilt")
        StudentInfoView(studentModel: studentModelView)
    }
}
