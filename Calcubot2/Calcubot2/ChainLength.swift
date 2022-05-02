//
//  ChainLength.swift
//  Calcubot2
//
//  Created by Student on 2022-05-02.
//

import SwiftUI

enum Chains: CustomStringConvertible, CaseIterable{
    var description: String{
        switch self{
        case .twentyFive : return "25"
        case .HtwentyFive : return "25H"
        case .thirtyFive : return "35"
        }
    }
    var pitch: Float{
        switch self{
        case .twentyFive: return 0.250
        case .HtwentyFive: return 0.250
        case .thirtyFive : return 0.375
        }
    }
    case twentyFive
    case HtwentyFive
    case thirtyFive
}

struct ChainLength: View {
    @State var chainType: Chains = .twentyFive
    @State var centerDist: String = ""
    @State var teethOne: String = ""
    @State var teethTwo: String = ""
    @State var links: String = "Links"
    
    func CalculateLength() {
        //got a working formula to implement
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
        NavigationView {
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
}

struct ChainLength_Previews: PreviewProvider {
    static var previews: some View {
        ChainLength()
    }
}
