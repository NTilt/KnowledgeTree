//
//  ModalView.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 20.02.2023.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var model: AppModel
    @EnvironmentObject var storage: Storage
    @State var viewState: CGSize = .zero
    @State var isDismissed = false
    @State var appear = [false, false, false]
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        let userModel = UserModelView(email: model.email)
        let user = userModel.getUser()
        ZStack {
            Color.clear.background(.regularMaterial)
                .ignoresSafeArea()
            
            Group {
                switch model.selectedModel {
                case .signIn:
                    SignInView()
                case .signUp:
                    SignUpView()
                }
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(x: viewState.width, y: viewState.height)
            .offset(y: isDismissed ? 1000 : 0)
            .rotationEffect(.degrees(viewState.width / 40))
            .rotation3DEffect(.degrees(viewState.height / 40), axis: (x: 1, y: 0, z: 0))
            .hueRotation(.degrees(viewState.width / 5))
            .gesture(drag)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
            .opacity(appear[0] ? 1 : 0)
            .offset(y: appear[0] ? 0 : 200)
            .padding(20)
            .background(
                Image("greenBlobs").offset(x: 200, y: -100)
                    .opacity(appear[2] ? 1 : 0)
                    .offset(y: appear[2] ? 0 : 10)
                    .blur(radius: appear[2] ? 0 : 40)
                    .allowsHitTesting(false)
            )
           
//            Button {
//                dismissModal()
//            } label: {
//                Image(systemName: "xmark")
//                    .font(.body.weight(.bold))
//                    .foregroundColor(.secondary)
//                    .padding(8)
//                    .background(.ultraThinMaterial, in: Circle())
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
//            .padding(20)
//            .opacity(appear[1] ? 1 : 0)
//            .offset(y: appear[1] ? 0 : -200)
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
        .fullScreenCover(isPresented: $isLogged) {
            if user is Student {
                StudentContentView(studentDocument: StudentDocument(student: user as! Student))
            }
            else {
                TeacherContentView()
            }
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                withAnimation(.openCard) {
                    viewState = .zero
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(AppModel())
    }
}

