//
//  Constants.swift
//  Calcubot2
//
//  Created by Student on 2022-04-22.
//

import Foundation

protocol DistUnits{
    var description: String {get}
    var conversionValue: Float {get}
    //var case?
}

enum ImpDistUnits: DistUnits, CaseIterable, CustomStringConvertible {
    
    var description: String {
        switch self {
        case .inch : return "Inch"
        case .foot : return "Foot"
        case .yard : return "Yard"
        case .mile : return "Mile"
        }
    }
    var conversionValue: Float {
        switch self {
        case .inch : return 0.0254
        case .foot : return 0.3048
        case .yard : return 0.9144
        case .mile : return 1609.344
        }
    }
    case inch
    case foot
    case yard
    case mile
}

enum MetDistUnits: DistUnits, CaseIterable, CustomStringConvertible {
    var description: String {
        switch self {
        case .mm : return "Milimeter"
        case .cm: return "Centimeter"
        case .dm: return "Decimeter"
        case .m : return "Meter"
        case .de :return "Decamter"
        case .hm :return "Hectometer"
        case .km :return "Kilometer"
        }
    }
    var conversionValue: Float {
        switch self {
        case .mm : return 0.001
        case .cm: return 0.01
        case .dm: return 0.1
        case .m : return 1
        case .de : return 10
        case .hm  : return 100
        case .km : return 1000
        }
    }
    case mm
    case cm
    case dm
    case m
    case de
    case hm
    case km
}
