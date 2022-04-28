//
//  GearRatio.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

struct GearRatio: View {
    @State var Input: String = ""
    @State var Output: String = ""
    @State var Answer: String = ""
    @State var ifFunctionCalled: Bool = false
    
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
        
        let newInput = intInput / gcd
        let newOutput = intOutput / gcd
        
        Answer = "\(newInput) : \(newOutput)"
    }
    
    
    func GCD_Calculator(a: Int, b: Int) -> Int{
        if(b == 0)
        {
            return a;
        }
        return GCD_Calculator(a: b, b: a % b);
    }
    
    var Overlay: some View {
        VStack{
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
            Button {
                AnswerFormatter()
            } label: {
                Text("Calculate")
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.myButton)
                            .addBorder(Color.myBackGround, width:5, cornerRadius: 5)
                    }
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
    var body: some View {
        NavigationView {
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
}


struct GearRatio_Previews: PreviewProvider {
    static var previews: some View {
        GearRatio()
    }
}
