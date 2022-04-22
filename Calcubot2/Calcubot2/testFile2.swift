//
//  testFile2.swift
//  Calcubot2
//
//  Created by Student on 2022-04-22.
//

import SwiftUI

struct testFile2: View {
    @State var selUnit = MetDistUnits.m
    
    var body: some View {
        VStack {
//            Picker("Units", selection: $selUnit, content: {
//                ForEach(MetDistUnits.allCases, content: {
//                    descript in Text(description.captailized)
//                })
//            })
        }
    }
}

struct testFile2_Previews: PreviewProvider {
    static var previews: some View {
        testFile2()
    }
}
