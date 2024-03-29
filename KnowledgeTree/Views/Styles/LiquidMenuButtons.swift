//
//  LiquidMenuButtons.swift
//  KnowledgeTree
//
//  Created by Никита Ясеник on 05.03.2023.
//

import SwiftUI

struct LiquidMenuButtons: View {
    
    // - Properties -
    @State var offsetOne: CGSize = .zero
    @State var offsetTwo: CGSize = .zero
    @State var offsetThree: CGSize = .zero
    @State var offsetFour: CGSize = .zero
    @State var offsetFive: CGSize = .zero
    @State var offsetSix: CGSize = .zero
    @State var offsetSeven: CGSize = .zero
    @State var offsetEight: CGSize = .zero
    @State private var isCollapsed: Bool = false
    @AppStorage("selectedTeacherTab") var selectedTeacherTab: TeacherTab = .home
    @EnvironmentObject var model: AppModel
    var completionForSaveInfo: () -> Void
    var completionForEdit: () -> Void
    
    // - Body -
    var body: some View {
        LiquidMenu()
    }
}


extension LiquidMenuButtons {
    
    private func LiquidMenu() -> some View {
        ZStack {
            Rectangle()
                .fill(.linearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom))
                .mask {
                    Canvas { context, size in
                        //Adding Filters
                        context.addFilter(.alphaThreshold(min: 0.8, color: .black))
                        context.addFilter(.blur(radius: 8))

                        //Drawing Layers
                        context.drawLayer { ctx in
                            //Placing symbols
                            for index in 1...9 {
                                if let resolvedView = context.resolveSymbol(id: index) {
                                    ctx.draw(resolvedView, at: CGPoint(x: size.width/2, y: size.height/2))
                                }
                            }
                        }
                    } symbols: {
                        Symbol(diameter: 120)
                            .tag(1)

                        Symbol(offset: offsetOne)
                            .tag(2)
                        
                        Symbol(offset: offsetTwo)
                            .tag(3)
                        
                        Symbol(offset: offsetThree)
                            .tag(4)
                        
                        Symbol(offset: offsetFour)
                            .tag(5)
                        
                        Symbol(offset: offsetFive)
                            .tag(6)
                        
                        Symbol(offset: offsetSix)
                            .tag(7)
                        
                        Symbol(offset: offsetSeven)
                            .tag(8)
                        
                        Symbol(offset: offsetEight)
                            .tag(9)
                    }
                }
            
            CancelButton().blendMode(.softLight).rotationEffect(Angle(degrees: isCollapsed ? 90 : 45))
            HomeButton().offset(offsetOne).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
//            SettingsButton().offset(offsetTwo).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
//
//            PlusButton().offset(offsetFour).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
            EditButton().offset(offsetThree).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
            
            SaveButton().offset(offsetFive).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
//            PersonButton().offset(offsetSix).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
//            TrashButton().offset(offsetSeven).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
//            MinusButton().offset(offsetEight).blendMode(.softLight).opacity(isCollapsed ? 1 : 0)
        }
        .frame(width: 500, height: 500)
        .contentShape(Circle())
    }
    
    private func Symbol(offset: CGSize = .zero, diameter: CGFloat = 75) -> some View {
        Circle()
            .frame(width: diameter, height: diameter)
            .offset(offset)
    }
    
    func HomeButton() -> some View {
        Button {
            selectedTeacherTab = .home
            model.showDetail.toggle()
        } label: {
            ZStack {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .frame(width: 65, height: 65)
        }
    }
    
    func CancelButton() -> some View {
        ZStack {
            Image(systemName: "xmark")
                .resizable()
                .frame(width: 35, height: 35)
                .aspectRatio(.zero, contentMode: .fit).contentShape(Circle())
        }
        .frame(width: 100, height: 100)
        .contentShape(Rectangle())
        .onTapGesture {
            
            withAnimation { isCollapsed.toggle() }
            withAnimation(.interactiveSpring(response: 0.35, dampingFraction: 0.7, blendDuration: 0.1).speed(0.5)) {
                offsetOne  = isCollapsed ? CGSize(width: 0, height: -120) : .zero
//                offsetTwo  = isCollapsed ? CGSize(width: 0, height: -205) : .zero
                offsetThree  = isCollapsed ? CGSize(width: 100, height: -80) : .zero
//                offsetFour  = isCollapsed ? CGSize(width: 180, height: -140) : .zero
                offsetFive  = isCollapsed ? CGSize(width: -100, height: -80) : .zero
//                offsetSix  = isCollapsed ? CGSize(width: -180, height: -140) : .zero
//                offsetSeven  = isCollapsed ? CGSize(width: -90, height: -180) : .zero
//                offsetEight  = isCollapsed ? CGSize(width: 90, height: -180) : .zero
            }
        }
    }

    func SettingsButton() -> some View {
        Button {
        } label: {
            ZStack {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .frame(width: 65, height: 65)
        }
    }
    
    func TrashButton() -> some View {
        ZStack {
            Image(systemName: "trash")
                .resizable()
                .frame(width: 28, height: 28)
        }
        .frame(width: 65, height: 65)
    }
    
    func MinusButton() -> some View {
        ZStack {
            Image(systemName: "minus.circle")
                .resizable()
                .frame(width: 28, height: 28)
        }
        .frame(width: 65, height: 65)
    }
    
    func PlusButton() -> some View {
        ZStack {
            Image(systemName: "plus.circle")
                .resizable()
                .frame(width: 28, height: 28)
        }
        .frame(width: 65, height: 65)
    }
    
    func PersonButton() -> some View {
        Button {
            print("aasasdasa")
        } label: {
            ZStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .frame(width: 65, height: 65)
        }
        
    }
    
    func SaveButton() -> some View {
        Button {
            completionForSaveInfo()
        } label: {
            ZStack {
                Image(systemName: "square.and.arrow.down")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .frame(width: 65, height: 65)
            
        }
    }
    
    func EditButton() -> some View {
        Button {
            completionForEdit()
        } label: {
            ZStack {
                Image(systemName: "pencil")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .frame(width: 65, height: 65)
            
        }
    }
    
}


struct LiquidPreviews: PreviewProvider {
    static var previews: some View {
        LiquidMenuButtons(completionForSaveInfo: {},
                          completionForEdit: {})
            .preferredColorScheme(.dark)
    }
}
