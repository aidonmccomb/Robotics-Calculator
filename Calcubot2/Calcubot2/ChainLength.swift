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
    @State var sprocketOne: String = ""
    @State var sprocketTwo: String = ""
    @State var links: String = "Links"
    
    func CalculateLength() {
        //got a working formula to implement
        guard let CD: Float = Float(centerDist), let teeth1: Float = Float(sprocketOne), let teeth2: Float = Float(sprocketTwo) else {
            centerDist = ""
            sprocketOne = ""
            sprocketTwo = ""
            links = "ERROR INVALID INPUT"
            return
        }
        
        let C = CD/chainType.pitch
        
        var T1, T2: Float
        
        if teeth1 < teeth2 {
            T2 = Float(teeth2)
            T1 = Float(teeth1)
        } else {
            T1 = Float(teeth2)
            T2 = Float(teeth1)
        }
        
        let mediary = (T2-T1)/(2*Float.pi)
        
        let L = (2*C)+((T1+T2)/2)+(mediary*mediary)*(1/C)
        
        links = String(L)
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
            TextField("Tooth Count 1", text: $sprocketOne)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.orange)
                }
            TextField("Tooth Count 2", text: $sprocketTwo)
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
                .foregroundColor(Color.lightGrey)
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
