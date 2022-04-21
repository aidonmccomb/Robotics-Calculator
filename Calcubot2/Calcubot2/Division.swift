//
//  Division.swift
//  Calcubot2
//
//  Created by Student on 2022-04-21.
//

import SwiftUI

struct Division: View {
    @ObservedObject var myUtility = MyUtility()
    
    let formatter: NumberFormatter = {
        $0.numberStyle = .decimal
        return $0
    }(NumberFormatter())
    
    var body: some View {
        VStack {
            HStack {
                Text("Dividend:")
                TextField("",value: $myUtility.dividend, formatter: formatter)
            }
            HStack {
                Text("Divisor:")
                TextField("",value: $myUtility.divisor, formatter: formatter)
            }
            HStack {
                Text("Quotient:")
                TextField("",value: $myUtility.quotient, formatter: formatter)
            }
            Button {
                myUtility.calculate()
            } label: {
                Text("Calculate")
            }
        }.keyboardType(.decimalPad)
    }
}

struct Division_Previews: PreviewProvider {
    static var previews: some View {
        Division()
    }
}
