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
    
    func Calculator() {
        //Need Greateast commmon divisor calculator
        // to give better answers in decimal form
        if let newIn = Float(Input), let newOut = Float(Output) {
            let Ans = newIn / newOut
            Answer = "\(Float(Ans)) : 1"
        }
    }
    
    var body: some View {
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
                Calculator()
            } label: {
                Text("Calculate")
            }
            HStack{
                Text("Answer:")
                TextField("Placeholder", text: $Answer)
            }
            
            
        }
    }
}


struct GearRatio_Previews: PreviewProvider {
    static var previews: some View {
        GearRatio()
    }
}
