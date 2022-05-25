//
//  TestFile3.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

class UserInputStages: ObservableObject {
    var StagesAdd: Int = 0
    
    @Published var Input: Array<String>
    @Published var Output: Array<String>
    
    @Published var Driving: Array<String>
    @Published var Driven: Array<String>
    
    @Published var Answer: Array<String>
    
    var TotalAnswer: Float{
        var holder: Float = 1

        for answer in Answer {
            holder = holder * Float(answer)!
        }
        
        return holder
    }
    
    init(){
        self.StagesAdd += 1
        
        self.Input = ["Placeholder"]
        self.Output = ["Placeholder"]
        
        self.Driving = ["Placeholder"]
        self.Driven = ["Placeholder"]
        
        self.Answer = ["Placeholder"]
    }
    
    func StageAdded(){
        self.StagesAdd += 1
    }
    
    func StageRemoved() {
        self.StagesAdd -= 1
    }

    
}

struct TestFile3: View {
    //user input for stage one
    @State var Input: String = ""
    @State var Output: String = ""
    @State var Driving: String = ""
    @State var Driven: String = ""
    @State var Answer: String = ""
    
    @ObservedObject var userInput = UserInputStages()
    
    @State var ifFunctionCalled: Bool = false
    
    //animation
    
    var isShowingInputError: Bool{
        return ifFunctionCalled && Input.isEmpty
    }
    
    func AnswerFormatter() {
        ifFunctionCalled = true
        
        guard let intInput = Int(Input),
              let intOutput = Int(Output)
        else {
            Input = ""
            Output = ""
            return
        }
        
        let gcd = GCD_Calculator(a: intInput, b: intOutput)
        
        userInput.Driving[userInput.StagesAdd-1] = String(intInput / gcd)
        userInput.Driven[userInput.StagesAdd-1] = String(intOutput / gcd)
        
        Answer = "\(Driving) : \(Driven)"
    }
    
    
    func GCD_Calculator(a: Int, b: Int) -> Int{
        if(b == 0)
        {
            return a;
        }
        return GCD_Calculator(a: b, b: a % b);
    }
    
    var AnimationView: some View {
        
        var driven, driving : Float
        
        driven = 6
        driving = 1
        //error handling for
        
        var total: Float {
            driving + driven}
        
        return HStack(spacing:0){
            SizedCircleView(myColor: .purple, mySize: driven, total: total, offsetDirection: .left)
                
            SizedCircleView(myColor: .green, mySize: driving, total: total, offsetDirection: .right)
                
        }
    }
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 1)
    
    var Overlay: some View {
        VStack{
        LazyVGrid(columns: columns){
            Rectangle()
                .frame(width: 350, height: 200)
                .foregroundColor(.white)
                .overlay(AnimationView)
            HStack{
                Text("Input:")
                    .foregroundColor(isShowingInputError ? .red : .black)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.myOrange)
                    }
                    .padding()
                TextField("Placeholder", text: $Input)
                    .keyboardType(.numbersAndPunctuation)
                    .foregroundColor(Color.red)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.lightGrey)
                    }
                    .padding()
            }
            HStack{
                Text("Output:")
                    .foregroundColor(isShowingInputError ? .red : .black)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.myBlue)
                    }
                    .padding()
                TextField("Placeholder", text: $Output)
                    .keyboardType(.numbersAndPunctuation)
                    .foregroundColor(Color.red)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.lightGrey)
                    }
                    .padding()
            }
        }
        VStack{
            HStack {
                Button {
                    AnswerFormatter()
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
                .disabled(userInput.StagesAdd == 3)
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
                TextField("Placeholder", text: $Answer)
                    .keyboardType(.numberPad)
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
