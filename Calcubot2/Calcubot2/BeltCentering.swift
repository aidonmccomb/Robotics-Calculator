//
//  BeltCentering.swift
//  Calcubot2
//
//  Created by Student on 2022-05-03.
//

import SwiftUI

enum Belts: CustomStringConvertible, CaseIterable{
    var description: String{
        switch self{
        case .mmfive : return "25"
        case .mmsix : return "25H"
        case .mmseven : return "35"
        }
    }
    var pitch: Float{
        switch self{
        case .mmfive: return 0.250
        case .mmsix: return 0.250
        case .mmseven : return 0.375
        }
    }
    case mmfive
    case mmsix
    case mmseven
}


struct BeltCentering: View {
    @State var beltType: Belts = .mmfive
    @State var length: String = ""
    @State var pulleyOne: String = ""
    @State var pulleyTwo: String = ""
    @State var centerDist: String = "Center Distance"
    
    func CalculateCenter() {
        guard let L = Float(length), let D = Float(pulleyOne), let d = Float(pulleyTwo) else {
            return
        }
        
        let C = (1/200)*(-157*d-157*D+100*L)
        
        centerDist = String(C)
        
    }
    
    var overlay: some View{
        VStack{
            Text("Metric")
                .foregroundColor(Color.lightGrey)
//            HStack {
//                Text("Belt Type")
//                Picker("Chain Type", selection: $beltType) {
//                    ForEach(Belts.allCases, id: \.description) { i in
//                        Text(String(i.description)).tag(i)
//                    }
//                }
           // }
            TextField("Length of Belt", text: $length)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                }
            TextField("Tooth Count 1", text: $pulleyOne)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.orange)
                }
            TextField("Tooth Count 2", text: $pulleyTwo)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.red)
                }
            Button {
                CalculateCenter()
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
            Text(String(centerDist))
        }
    }
    
    var body: some View {
        Rectangle().fill(Color.myBackGround)
            .edgesIgnoringSafeArea(.all)
            .overlay(overlay)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Belt Centerer").font(.largeTitle)
                            .foregroundColor(Color.lightGrey)
                    }
                }
                
            }
    }
}

struct BeltCentering_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BeltCentering()
        }
    }
}
