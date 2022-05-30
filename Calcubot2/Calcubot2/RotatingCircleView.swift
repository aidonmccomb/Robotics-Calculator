//
//  SizeCircleView.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI





struct RotatingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 0) {
            RotatingCircleView(
                fill: .green,
                scale: 0.5,
                direction: .right
            )
            RotatingCircleView(
                fill: .red,
                scale: 0.5,
                direction: .left
            )
        }
        .frame(width: 200, height: 200)
        .previewLayout(.sizeThatFits)
    }
}
