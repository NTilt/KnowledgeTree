//
//  AuthView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 25.01.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = false
    @State private var mainScreen = false
    let storage = Storage()
    @ObservedObject private var authModelView = AuthModelView()
    
    @State private var email = ""
    @State private var login = ""
    @State private var password = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    
    var body: some View {
        VStack() {
            VStack() {
                LinearGradient(colors: [.red, .purple], startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Text("KnowledgeTree")
                            .font(Font.system(size: 46, weight: .bold))
                            .multilineTextAlignment(.center)
                    )
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .shadow(radius: 1)
            }
            .padding(30)
            
            if isAuth {
                VStack() {
                    LinearGradient(colors: [.pink, .black], startPoint: .leading, endPoint: .trailing)
                        .mask(
                            Text("Авторизация")
                                .font(Font.system(size: 25, weight: .bold))
                                .multilineTextAlignment(.center)
                        )
                        .frame(maxWidth: 300, maxHeight: 75)
                        .background(.green)
                        .shadow(radius: 11)
                        .cornerRadius(25)
                        .padding(30)
                    
                    TextField("Введите login:", text: $login)
                        .font(.title3.bold())
                        .padding()
                        .frame(maxWidth: 400, maxHeight: 75)
                        .background(.green)
                        .shadow(radius: 11)
                        .cornerRadius(15)
                        .padding(10)
                    
//                    TextField("Введите e-mail:", text: $email)
//                        .font(.title3.bold())
//                        .padding()
//                        .frame(maxWidth: 400, maxHeight: 75)
//                        .background(.green)
//                        .shadow(radius: 11)
//                        .cornerRadius(15)
//                        .padding(10)
                    
                    SecureField("Введите пароль:", text: $password)
                        .font(.title3.bold())
                        .padding()
                        .frame(maxWidth: 400, maxHeight: 75)
                        .background(.green)
                        .shadow(radius: 11)
                        .cornerRadius(15)
                    
                    Button {
                        authModelView.checkInputData(inputEmail: login, inputPassword: password) { (result) in
                            switch result {
                                
                            case .success(_):
                                mainScreen.toggle()
                                
                            case .failure(let error):
                                print(error)
                                alertMessage = error.errorDescription
                                showAlert = true
                            }
                        }
                    } label: {
                        Text("Войти")
                            .foregroundColor(.black)
                            .font(.title3.bold())
                            .frame(maxWidth: 300, maxHeight: 75)
                            .background(.green)
                            .shadow(radius: 11)
                            .cornerRadius(25)
                            .padding(30)
                    }.alert(alertMessage, isPresented: $showAlert) {
                        Button("OK", role: .cancel) {
                            alertMessage = ""
                        }
                    }
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(colors: [Color("topGreen"), .green], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        .onTapGesture {
            if !isAuth {
                isAuth.toggle()
            }
        }
        .fullScreenCover(isPresented: $mainScreen) {
            let studenModelInfo = StudentModelView(login: login)
            StudentInfoView(studentModel: studenModelInfo)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
