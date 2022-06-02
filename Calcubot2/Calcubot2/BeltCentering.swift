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

class BeltUserInput: ObservableObject{
    @Published var beltType: Belts = .mmfive
    @Published var length: String = ""
    @Published var pulleyOne: String = ""
    @Published var pulleyTwo: String = ""
    @Published var centerDistFloat: Float = 2
    @Published var centerDistString: String = ""
    
    func CalculateCenter() {
        guard var L = Float(self.length), let D = Float(self.pulleyOne), let d = Float(self.pulleyTwo) else {
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
        self.centerDistFloat = C
        
    }
    
}

struct BeltCentering: View {
   var beltInput = BeltUserInput()
    
    var AnimationView: some View{
        Circle()
            .fill(.red)
    }
    
    var overlay: some View{
        VStack{
            Rectangle()
                .frame(width: 350, height: 100)
                .foregroundColor(.lightGrey)
                .cornerRadius(10)
                .overlay(AnimationView)
            
            HStack {
                Text("Belt Type")
                    .padding()
                    .background(.gray)
                Picker("Chain Type", selection: $beltInput.beltType) {
                    ForEach(Belts.allCases, id: \.description) { i in
                        Text(String(i.description)).tag(i)
                    }
                }
                .padding()
                .background(.gray)
            }
            VStack{
            HStack{
                Text("Length of Belt")
                    .padding()
                    .background(Color.blue)
                TextField("Length of Belt", text: $beltInput.length)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.blue)
                }
            }
            HStack {
                Text("Tooth Count 1")
                    .padding()
                    .background(Color.orange)
                TextField("Tooth Count 1", text: $beltInput.pulleyOne)
                    .keyboardType(.numbersAndPunctuation)
                    .foregroundColor(Color.black)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.orange)
                    }
            }
            HStack{
                Text("Tooth Count 2")
                    .padding()
                    .background(Color.red)
                TextField("Tooth Count 2", text: $beltInput.pulleyTwo)
                .keyboardType(.numbersAndPunctuation)
                .foregroundColor(Color.black)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.red)
                }
            }
            }.padding()
            Button {
                beltInput.CalculateCenter()
            } label: {
                Text("Calculate")
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.myButton)
                            .addBorder(Color.myBackGround, width:5, cornerRadius: 5)
                    }
            }
            HStack{
                Text("Center Distance")
                    .padding()
                    .background(Color.pink)
                Text(String(self.centerDistFloat))
                    .padding()
                    .background(Color.pink)
                    
            }.padding()
            
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
