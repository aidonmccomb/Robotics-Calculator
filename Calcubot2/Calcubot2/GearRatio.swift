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
    
    func AnswerFormatter() {
        
        let gcd = GCD_Calculator(a: Int(Input)!, b: Int(Output)!)
        
        let newInput = Int(Input)!/gcd
        let newOutput = Int(Output)!/gcd
        
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
                TextField("Placeholder", text: $Input)
            }
            HStack{
                Text("Output:")
                TextField("Placeholder", text: $Output)
            }
            Button {
                AnswerFormatter()
            } label: {
                Text("Calculate")
            }
            HStack{
                Text("Answer:")
                TextField("Placeholder", text: $Answer)
            }
            
            
        }
    }
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.mint)
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
