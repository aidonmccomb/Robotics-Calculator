//
//  TestFile3.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

enum GearRatioErrors: Error {
    case toFloatFailDriving
    case toFloatFailDriven
    case displayAnswerFail
    case displayStageFail
}


struct TestFile3: View {
    var body: some View {
        Circle()
            .fill(.red)
    }
}

struct TestFile3_Previews: PreviewProvider {
    static var previews: some View {
        TestFile3()
    }
}
