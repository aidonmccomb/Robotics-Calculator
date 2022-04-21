//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

enum distUnits: CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .mm : return "milimeter"
        case .cm: return "centimeter"
        case .dm: return "decimeter"
        case .m : return "meter"
        case .de :return "decamter"
        case .hm :return "hectometer"
        case .km :return "kilometer"
            
        case .inch : return "inch"
        case .foot : return "foot"
        case .yard : return "yard"
        case .mile : return "mile"
            
            //default : return "meter"
            
        }
    }
    var hashInto: Float {
        switch self {
        case .mm : return 0.001
        case .cm: return 0.01
        case .dm: return 0.1
        case .m : return 1
        case .de : return 10
        case .hm  : return 100
        case .km : return 1000
            
        case .inch : return 0.0254
        case .foot : return 0.3048
        case .yard : return 0.9144
        case .mile : return 1609.344
        }
    }
    //Metric
    case mm
    case cm
    case dm
    case m
    case de
    case hm
    case km
    //Imperial
    case inch
    case foot
    case yard
    case mile
}

struct UnitConversion: View {
    @State var UnitOne: distUnits = distUnits.m
    @State var ValueOne: String = ""
    @State var UnitTwo: distUnits = distUnits.inch
    @State var ValueTwo: String = ""
    
    func Convert(){
        let Mediary = Float(ValueOne)! * UnitOne.hashInto
        
        let Ans = Mediary / UnitTwo.hashInto
        
        ValueTwo = String(Float(Ans))
    }
    
    func Swap(){
        let Mediary = Float(ValueTwo)! * UnitTwo.hashInto
        
        let Ans = Mediary / UnitOne.hashInto
        
        ValueOne = String(Float(Ans))
    }
    
    var body: some View {
        VStack(alignment:.center, spacing: 10){
            HStack(alignment:.center, spacing: 10){
                Text("Metric")
                Picker("Unit One", selection: $UnitOne) {
                    Text("Milimeters").tag(distUnits.mm)
                    Text("Centimeters").tag(distUnits.cm)
                    Text("Decimeters").tag(distUnits.dm)
                    Text("Meters").tag(distUnits.m)
                    Text("Decameters").tag(distUnits.de)
                    Text("Hectometers").tag(distUnits.hm)
                    Text("Kilometers").tag(distUnits.km)
                }
                TextField("Value", text: $ValueOne)
            }
            HStack(alignment:.center, spacing: 10){
                Text("Impreail")
                Picker("Unit Two", selection: $UnitTwo) {
                    Text("Inches").tag(distUnits.inch)
                    Text("Feet").tag(distUnits.foot)
                    Text("Yard").tag(distUnits.yard)
                    Text("Mile").tag(distUnits.mile)
                }
                TextField("Answer", text: $ValueTwo)
            }
            Button {
                Convert()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.indigo)
                        .frame(width: 120, height: 40, alignment: .center)
                    Text("Convert")
                        .foregroundColor(Color.indigo)
                        .colorInvert()
                }
            }
            Button {
                Swap()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mint)
                        .frame(width: 120, height: 40, alignment: .center)
                    Text("Swap")
                        .foregroundColor(Color.mint)
                        .colorInvert()
                }
            }


        }
    }
}


struct UnitConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversion()
    }
}
