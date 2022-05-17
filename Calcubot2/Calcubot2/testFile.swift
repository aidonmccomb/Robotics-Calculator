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

struct GearRatioTest: View {
    @State var Input: String = ""
    @State var Output: String = ""
    @State var Answer: String = ""
    @State var ifFunctionCalled: Bool = false
    @State var stageAddable: Bool = true
    
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
    
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 1)
    
    var Overlay: some View {
        VStack{
            LazyVGrid(columns: columns){
                
                //start of section want repeatable
                Text("Stage 1")
                    .foregroundColor(Color.lightGrey)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.medGrey)
                    }
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
                //start of section want repeatable
            }
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
                    stageAddable.toggle()
                } label: {
                    Text(stageAddable ? "Add Stage" : "Remove Stage")
                        .foregroundColor(Color.myButton)
                        .padding()
                        .background{
                            RoundedRectangle(cornerRadius: 5)
                                .fill(stageAddable ? .blue : .red)
                        }
                        .padding()
                    
                }
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
        NavigationView {
            GearRatioTest()
        }
    }
}

