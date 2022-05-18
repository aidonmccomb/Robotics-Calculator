//
//  TestFile3.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

struct TestFile3: View {
    @State var Input: String = ""
    @State var Output: String = ""
    @State var Answer: String = ""
    @State var newInput: String = ""
    @State var newOutput: String = ""
    @State var ifFunctionCalled: Bool = false
    @State private var isRotated = false
    @State var isAnimated: Bool = !UserDefaults.standard.bool(forKey: "noAnimation")
    
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
        
        newInput = String(intInput / gcd)
        newOutput = String(intOutput / gcd)
        
        Answer = "\(newInput) : \(newOutput)"
    }
    
    
    func GCD_Calculator(a: Int, b: Int) -> Int{
        if(b == 0)
        {
            return a;
        }
        return GCD_Calculator(a: b, b: a % b);
    }
    
    var myAnimation: Animation {
        Animation.linear
            .speed(0.1)
            .repeatForever(autoreverses: false)
    }
    
    var AnimationView: some View {
        
        var driven, driving : Float
        
        driven = 6
        driving = 1
        //error handling for
        
        var total: Float {
            driving + driven}
        
        return HStack(spacing:0){
            SizedCircleView(myColor: .purple, mySize: driven, total: total )
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                .onAppear {
                    withAnimation(myAnimation) {
                        isRotated.toggle()
                    }
                }
            SizedCircleView(myColor: .green, mySize: driving, total: total )
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
                .onAppear {
                    withAnimation(myAnimation) {
                        isRotated.toggle()
                    }
                }
        }
        
    }
    
    
    
    
    var Overlay: some View {
        VStack{
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
