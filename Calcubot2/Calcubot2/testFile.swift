//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//
//
//  GearRatio.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    
    let buttonColor: Color
    let borderColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(borderColor)
            .padding()
            .background(backgroundColor(isPressed: configuration.isPressed))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
    
    func backgroundColor(isPressed: Bool) -> Color {
        // isPressed vs isEnabled
        switch (isEnabled, isPressed) {
        case (false, _):
            return Color.gray
        case (true, true):
            return buttonColor.opacity(0.5)
        case (true, false):
            return buttonColor
        }
    }
}

struct ButtonStyleView: View {
    @State var toggle: Bool = false
    
    var body: some View {
        VStack{
            Text("Button Style")
            Button {
                //toggle.toggle()
            } label: {
                Text("Hello World")
            }.buttonStyle(MyButtonStyle(buttonColor: .myOrange, borderColor: .red))
                .disabled(toggle)
            Button {
                toggle.toggle()
            } label: {
                Text("Toggle")
            }.buttonStyle(MyButtonStyle(buttonColor: .myOrange, borderColor: .red))
        }
    }
}


struct GearRatioTest: View {
    @ObservedObject var userInput = UserInputStages()
    
    @State var ifFunctionCalled: Bool = false
    
    var isShowingInputError: Bool{
        return ifFunctionCalled && userInput.Input[0].isEmpty
    }
    
    func GetDisplayValues(inDriven : String, inDriving : String) -> (Float, Float) {
        if let floatDriven = Float(inDriven), let floatDriving = Float(inDriving) {
            var scaleDriven, scaleDriving : Float
            
            let total = floatDriven + floatDriving
            
            scaleDriven = floatDriven / total
            scaleDriving = floatDriving / total
            
            return ( scaleDriven, scaleDriving )
        } else {
            return (0.9, 0.6)
        }
    }
    
    var AnimationView: some View {
        let (driven, driving) = GetDisplayValues(inDriven: userInput.Driven, inDriving: userInput.Driving)
        
        return HStack(spacing:0){
            RotatingCircleView(fill: .purple, scale: CGFloat(driven), direction: .right)
            
            RotatingCircleView(fill: .green, scale: CGFloat(driving), direction: .left)
            
        }
    }
    
    var Overlay: some View {
        VStack{
            VStack(){
                Text("Final Ratio Diagram")
                    .font(.title)
                
                Rectangle()
                    .frame(width: 350, height: 200)
                    .foregroundColor(.lightGrey)
                    .cornerRadius(10)
                    .overlay(AnimationView)
                HStack{
                    VStack{
                        Text("Input:")
                            .foregroundColor(isShowingInputError ? .red : .black)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.myOrange)
                            }
                            .padding()
                        Text("Output:")
                            .foregroundColor(isShowingInputError ? .red : .black)
                            .background {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.myBlue)
                            }
                            .padding()
                    }
                    ForEach(0..<userInput.StagesAdd, id: \.self) { index in
                        VStack{
                            TextField("Placeholder", text: $userInput.Input[index])
                                .keyboardType(.numbersAndPunctuation)
                                .foregroundColor(Color.red)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.lightGrey)
                                }
                                .padding()
                            TextField("Placeholder", text: $userInput.Output[index])
                                .keyboardType(.numbersAndPunctuation)
                                .foregroundColor(Color.red)
                                .background {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.lightGrey)
                                }
                                .padding()
                        }
                    }
                    
                    
                }
                
            }
            VStack{
                HStack {
                    Button {
                        userInput.AnswerFormatter()
                    } label: {
                        Text("Calculate")
                            .frame(width: CGFloat.infinity, height: CGFloat.infinity, alignment: .center)
                    }.buttonStyle(MyButtonStyle(buttonColor: Color.green, borderColor: Color.myBlue))
                        .padding()
                    Button {
                        userInput.StageAdded()
                    } label: {
                        Text("Add Stage")
                            .frame(width: CGFloat.infinity, height: CGFloat.infinity, alignment: .center)
                    }.buttonStyle(MyButtonStyle(buttonColor: Color.myBlue, borderColor: Color.myButton))
                        .disabled(userInput.StagesAdd == 3)
                        .padding()
                 
                    Button {
                        userInput.StageRemoved()
                    } label: {
                        Text("Remove Stage")
                            .frame(width: CGFloat.infinity, height: CGFloat.infinity, alignment: .center)
                    }
                        .buttonStyle(MyButtonStyle(buttonColor: Color.red, borderColor: Color.myButton))
                        .disabled(userInput.StagesAdd == 1)
                        .padding()
                }
                //on keyboard press "Return"
                
                HStack{
                    Text("Answer:")
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                    Text(String(userInput.Answer))
                        .foregroundColor(Color.red)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                }
            }
        }
    }
    
    var body: some View {
        Rectangle().fill(Color.myBackGround)
            .edgesIgnoringSafeArea(.all)
            .overlay(Overlay)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Gear Ratio Finder").font(.largeTitle)
                        .foregroundColor(Color.lightGrey)
                }
            }
    }
}



struct GearRatioTest_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                GearRatioTest()
        }
            ButtonStyleView()
        }
    }
}

