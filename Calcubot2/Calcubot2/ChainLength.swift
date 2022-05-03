//
//  ChainLength.swift
//  Calcubot2
//
//  Created by Student on 2022-05-02.
//

import SwiftUI

struct ChainLength: View {
    @State var chainType: Chains = .twentyFive
    @State var centerDist: String = ""
    @State var teethOne: String = ""
    @State var teethTwo: String = ""
    @State var links: String = "Links"
    
    func CalculateLength() {
        //got a working formula to implement
        guard let CD: Float = Float(centerDist), let T1: Float = Float(teethOne), let T2: Float = Float(teethTwo) else {
            return
        }
        
        //CAST Method of chain length determining
        let C = CD/chainType.pitch
        let A = T1 + T2
        let S = T2 - T1
        let T = 11.6*pow(10, 0.319*S)
        
        links = String(2*C+(A/2)+T/C)
    }
    
    var overlay: some View{
        VStack{
            Text("Title")
                .foregroundColor(Color.lightGrey)
            HStack {
                Text("Chain Type")
                Picker("Chain Type", selection: $chainType) {
                    ForEach(Chains.allCases, id: \.description) { i in
                        Text(String(i.description)).tag(i)
                    }
                }
            }
            TextField("Center Distance", text: $centerDist)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                }
            TextField("Tooth Count 1", text: $teethOne)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.orange)
                }
            TextField("Tooth Count 2", text: $teethTwo)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.red)
                }
            Button {
                CalculateLength()
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
            Text(String(links))
        }
    }
    
    var body: some View {
        Rectangle().fill(Color.myBackGround)
            .edgesIgnoringSafeArea(.all)
            .overlay(overlay)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Chain Length").font(.largeTitle)
                        .foregroundColor(Color.lightGrey)
                }
            }
    }
}

struct ChainLength_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChainLength()
        }
    }
}
