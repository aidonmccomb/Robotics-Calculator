//
//  testFile2.swift
//  Calcubot2
//
//  Created by Student on 2022-04-22.
//

import SwiftUI


enum Metric: String, CaseIterable {
    case meter
    case centimeter
}

enum Imperial: String, CaseIterable {
    case foot
    case mile
}

struct testFile2: View {
    @State private var metricSelection: Metric = .meter
    @State private var imperialSelection: Imperial = .foot
    @State private var isFlipped = false
    
    var body: some View {
        VStack {
            if isFlipped {
                Picker("Metric", selection: $metricSelection) {
                    ForEach(Metric.allCases, id: \.rawValue) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
                Picker("Imperial", selection: $imperialSelection) {
                    ForEach(Imperial.allCases, id: \.rawValue) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
            } else {
                Picker("Imperial", selection: $imperialSelection) {
                    ForEach(Imperial.allCases, id: \.rawValue) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
                Picker("Metric", selection: $metricSelection) {
                    ForEach(Metric.allCases, id: \.rawValue) { unit in
                        Text(unit.rawValue)
                            .tag(unit)
                    }
                }
            }
            Button {
                isFlipped.toggle()
            } label: {
                Text("Flip")
            }
        }
    }
}


struct testFile2_Previews: PreviewProvider {
    static var previews: some View {
        testFile2()
    }
}
