//
//  TestFile3.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

enum GearRatioErrors: Error {
    case toFloatFailDriving
    case toFloatFailDriven
    case displayAnswerFail
    case displayStageFail
}

class UserInputStages: ObservableObject {
    var StagesAdd: Int = 0
    
    @Published var Input: Array<String>
    @Published var Output: Array<String>
    
    @Published var Driving: String
    @Published var Driven: String
    
    @Published var Answer: String
    
    func AnswerFormatter() {
        //ifFunctionCalled = true
        
        var prodInput: Int = 1
        
        for num in Input {
            prodInput = prodInput * Int(num)!
        }
        
        var prodOutput: Int = 1
        
        for num in Output {
            prodOutput = prodOutput * Int(num)!
        }
        
        let gcd = GCD_Calculator(a: Int(prodInput), b: Int(prodOutput))
        
        self.Driving = String(prodInput / gcd)
        self.Driven = String(prodOutput / gcd)
        
        self.Answer = "\(Driving) : \(Driven)"
    }
    
    func GCD_Calculator(a: Int, b: Int) -> Int{
        if(b == 0)
        {
            return a;
        }
        return GCD_Calculator(a: b, b: a % b);
    }
    
    func StageAdded(){
        self.StagesAdd += 1
        
        self.Input.append("")
        self.Output.append("")
        
    }
    
    func StageRemoved() {
        self.StagesAdd -= 1
        
        self.Input.removeLast()
        self.Output.removeLast()
        
    }
    
    init(){
        self.StagesAdd += 1
        
        self.Input = [""]
        self.Output = [""]
        
        self.Driving = ""
        self.Driven = ""

        self.Answer = "Final Ratio"
    }

}

struct TestFile3: View {
    @ObservedObject var userInput = UserInputStages()
    
    @State var ifFunctionCalled: Bool = false
    
    //animation
    
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
                            .foregroundColor(Color.blue)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.myButton)
                            }
                            .padding()
                    }
                    Button {
                        userInput.StageAdded()
                    } label: {
                        Text("Add Stage")
                            .foregroundColor(Color.myButton)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.blue)
                            }
                            .padding()
                    }
                    //.disabled(userInput.StagesAdd == 3)
                    Button {
                        userInput.StageRemoved()
                    } label: {
                        Text("Remove Stage")
                            .foregroundColor(Color.myButton)
                            .padding()
                            .background{
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.red)
                            }
                            .padding()
                    }
                    .disabled(userInput.StagesAdd == 1)
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

struct TestFile3_Previews: PreviewProvider {
    static var previews: some View {
        TestFile3()
    }
}
