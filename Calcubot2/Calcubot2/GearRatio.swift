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
            //insert image
            Rectangle()
                .fill(.gray)
                .frame(width: 350, height: 200, alignment: .center)
            HStack{
                Text("Input:")
                    .foregroundColor(isShowingInputError ? .red : .black)
                TextField("Placeholder", text: $Input)
                    .keyboardType(.numbersAndPunctuation)
                    .foregroundColor(Color.red)
            }
            HStack{
                Text("Output:")
                    .foregroundColor(isShowingInputError ? .red : .black)
                TextField("Placeholder", text: $Output)
                    .keyboardType(.numbersAndPunctuation)
                    .foregroundColor(Color.red)
            }
            Button {
                AnswerFormatter()
            } label: {
                Text("Calculate")
            }
            //on keyboard press "Return"
            
            HStack{
                Text("Answer:")
                TextField("Placeholder", text: $Answer)
                    .keyboardType(.numberPad)
                    .foregroundColor(Color.red)
            }
            
            
        }
    }
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.white)
                .edgesIgnoringSafeArea(.all)
                .overlay(Overlay)
        }
    }
}


struct GearRatio_Previews: PreviewProvider {
    static var previews: some View {
        GearRatio()
    }
}
