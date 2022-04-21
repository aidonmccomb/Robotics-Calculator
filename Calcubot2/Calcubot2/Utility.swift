//
//  Utility.swift
//  Calcubot2
//
//  Created by Student on 2022-04-21.
//

import Foundation

class MyUtility: ObservableObject {
    @Published var divisor: Double = 0
    @Published var dividend: Double = 0
    @Published var quotient: Double = 0
    
    func calculate() {
        quotient = dividend / divisor
}
}
