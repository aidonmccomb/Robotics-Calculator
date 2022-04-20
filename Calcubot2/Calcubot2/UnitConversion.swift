//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

enum distUnits: CaseIterable, CustomStringConvertible, Hashable {
    var description: String {
        switch self {
        case .mm : return "milimeter"
        case .cm: return "centimeter"
        case .dm: return "decimeter"
        case .m : return "meter"
        case .de :return "decamter"
        case .hm :return "hectometer"
        case .km :return "kilometer"
            
        case .inch:return"inch"
        case .foot:return"foot"
        case .yard:return"yard"
        case .mile:return"mile"
            
        default : return "meter"
            
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
            
        default : return 1
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
    @State var UnitOne: distUnits?
    @State var UnitTwo: distUnits?
    var body: some View {
        VStack{
            Picker("Unit One", selection: $UnitOne) {
                <#code#>
            }
        }
    }
}

struct UnitConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversion()
    }
}
