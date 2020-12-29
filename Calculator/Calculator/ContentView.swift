//
//  Calculator.swift
//  SwiftUICW2
//
//  Created by Omar Alibrahim on 12/19/20.
//  Copyright: Kuwait Codes 2020 code.kw

import SwiftUI
import MobileCoreServices

struct Calculator: View {
    // MARK: - Add states here
    @State var showingPopup = false
    @State var num : String = ""
    @State var s : String = ""
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing:10){
                Spacer()
                HStack{
                    Spacer()
                    Text(num)
                        .modifier(TitleModifier())
                        .animation(.easeIn(duration: 0.1))
                        .onLongPressGesture(minimumDuration: 0.1){
                            UIPasteboard.general.string = num
                            showingPopup = true
                        }
                }
                HStack{
                    Text("C").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num = ""
                        }
                    Text("±").modifier(ButtonModifier(type: .gray))
                    Text("%").modifier(ButtonModifier(type: .gray))
                    Text("÷").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("7").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("7")
                        }
                    Text("8").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("8")
                        }
                    Text("9").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("9")
                        }
                    Text("×").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("4").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("4")
                        }
                    Text("5").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("5")
                        }
                    Text("6").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("6")
                        }
                    Text("-").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("1").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("1")
                        }
                    Text("2").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("2")
                        }
                    Text("3").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append("3")
                        }
                    Text("+").modifier(ButtonModifier(type: .orange))
                }
                HStack{
                    Text("0").modifier(Zero())
                        .onTapGesture {
                            num.append("0")
                        }
                    Text(".").modifier(ButtonModifier(type: .gray))
                        .onTapGesture {
                            num.append(".")
                        }
                    Text("=").modifier(ButtonModifier(type: .orange))
                }
                
            }
            .padding()
            
        }
        .popup(isPresented: $showingPopup, type: .floater(), position: .top, autohideIn: 2) {
                    HStack {
                        Text("Copied")
                    }
                    .frame(width: 200, height: 60)
                    .background(Color(red: 1, green: 1, blue: 1))
                    .cornerRadius(30.0)
    }
}
}

/** # Don't touch this code at all
 This code is to minimize the code you write for each button.
 You create modifiers and add them to each button, and they will all share same modifiers
 */

// 1. Title Modifier: To present the result
struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.system(size: 120, weight: .thin, design: .default))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
}

// 2. Button Modifier:
struct ButtonModifier: ViewModifier{
    enum `Type`{case gray, orange, zero}
    var type: Type
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .frame(width: type == .zero ? 190 : 80, height: 80)
            .background(self.type == .gray ? Color.gray : Color.orange)
            .clipShape(Circle())
            .foregroundColor(Color.white)
            .padding(2)
    }
}

// 3. Zero Modifier, this view modifier for 0 specifically, where it width is
struct Zero: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .multilineTextAlignment(.leading)
            .frame(width:  190 , height: 80)
            .background(Color.gray)
            .clipShape(Capsule())
            .foregroundColor(Color.white)
        
    }
}

struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Calculator()
                .previewDevice("iPhone 11")
        }//.environment(\.colorScheme, .dark)
    }
}
