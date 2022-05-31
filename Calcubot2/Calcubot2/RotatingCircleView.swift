//
//  RotatingCircleView.swift
//  Calcubot2
//
//  Created by Student on 2022-05-31.
//

import SwiftUI

struct RotatingCircleView: View {
    @State private var isRotated = false
    let fill: Color
    let scale: CGFloat
    let direction: Direction

    var animation: Animation {
        Animation.linear
            .speed(scale / 1.5)
            .repeatForever(autoreverses: false)
    }

    var overlay: some View {
        Rectangle()
            .fill(.gray)
            .frame(height: 5)
    }

    var body: some View {
        let (upperRot, lowerRot) =  rotationDecider()
        
        GeometryReader { proxy in
            Circle()
                .fill(fill)
                .overlay(overlay)
                .rotationEffect(Angle.degrees(isRotated ? upperRot : lowerRot))
                .scaleEffect(scale)
                .offset(x: xOffset(for: proxy.size.width), y: 0)
                .onAppear {
                    withAnimation(animation) {
                        isRotated.toggle()
                    }
                }
        }
    }

    private func rotationDecider() -> (Double, Double) {
        if direction == .right {
            return(360, 0)
        }
        else {
            return (0, 360)
        }
    }
    
    private func xOffset(for width: CGFloat) -> CGFloat {
        direction.value*(width/2-(width/2*scale))
    }
}


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
