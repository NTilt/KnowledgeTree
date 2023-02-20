//
//  SignUpView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct SignUpView: View {
    enum Field: Hashable {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @FocusState var focusedField: Field?
    @State var circleY: CGFloat = 150
    @EnvironmentObject var model: Model
    @State var appear = [false, false, false]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Регистрация")
                .font(.largeTitle).bold()
                .opacity(appear[0] ? 1 : 0)
                .offset(y: appear[0] ? 0 : 20)
            Text("Отслеживайте свой прогресс в учебе, а также следите за важными новостями от преподавателей")
                .font(.headline)
                .opacity(appear[1] ? 1 : 0)
                .offset(y: appear[1] ? 0 : 20)
            Group {
                TextField("Почта", text: $email)
                    .inpuStyle(icon: "envelope.open")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusedField, equals: .email)
                    .shadow(color: focusedField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                SecureField("Пароль", text: $password)
                    .inpuStyle(icon: "key")
                    .textContentType(.password)
                    .focused($focusedField, equals: .password)
                    .shadow(color: focusedField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                Button {} label: {
                    Text("Создать аккаунт")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .blendMode(.overlay)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                Divider()
                
                HStack {
                    Text("Уже есть аккаунт?")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .tint(.secondary)
                    
                    Button {
                        model.selectedModel = .signIn
                    } label: {
                        Text("**Войти**")
                            .font(.footnote)
                            //.foregroundColor(.secondary)
                    }
                }
            }
            .opacity(appear[2] ? 1 : 0)
            .offset(y: appear[2] ? 0 : 20)
            
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(.blue)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circleY)
        )
        .strokeStyle(cornerRadius: 30)
        .onChange(of: focusedField) { newValue in
            withAnimation {
                if newValue == .email {
                    circleY = 150
                }
                else {
                    circleY = 220
                }
            }
           
        }
        .onAppear {
            withAnimation(.spring().delay(0.1)) {
                appear[0] = true
            }
            withAnimation(.spring().delay(0.2)) {
                appear[1] = true
            }
            withAnimation(.spring().delay(0.3)) {
                appear[2] = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignUpView()
                .environmentObject(Model())
        }
    }
}
