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
        case .mmfive : return "5 mil"
        case .mmthree : return "10 mil"
        }
    }
    var pitch: Float{
        switch self{
        case .mmfive: return 0.05/25.4
        case .mmthree: return 0.03/25.4
        }
    }
    case mmfive
    case mmthree
}


struct BeltCentering: View {
    @State var beltType: Belts = .mmfive
    @State var length: String = ""
    @State var pulleyOne: String = ""
    @State var pulleyTwo: String = ""
    @State var centerDist: String = "Center Distance"
    
    func CalculateCenter() {
        guard var L = Float(length), let D = Float(pulleyOne), let d = Float(pulleyTwo) else {
            return
        }
        
        //Convert mm to in
        L = L/25.4
        
        //get tooth pitch (in inches)
        let T = beltType.pitch
        
        //assignment of Small v. Bigger pulley
        var P1, P2 : Float
        
        if D < d {
            P1 = d
            P2 = D
        } else {
            P1 = D
            P2 = d
        }
        
        //formula broken down for readability
        let x = L-0.5*T*pow(P1+P2,2)
        
        let y = (2*pow(T,2)*pow(P1-P2,2))/pow(Float.pi,2)
        
        let A = x - y
        
        let B = sqrt(A)
        
        let C = L/4 - T/8 * (P1+P2) + 1/4 * B
        
        //assigment to state var
        centerDist = String(C)
        
    }
    
    var overlay: some View{
        VStack{
            Text("Metric")
                .foregroundColor(Color.lightGrey)
            HStack {
                Text("Belt Type")
                Picker("Chain Type", selection: $beltType) {
                    ForEach(Belts.allCases, id: \.description) { i in
                        Text(String(i.description)).tag(i)
                    }
                }
            }
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
