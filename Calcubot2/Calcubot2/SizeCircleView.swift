//
//  SizeCircleView.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

enum OffsetDirection{
    var modifier: CGFloat{
        switch self {
        case .left : return 1
        case .right : return -1
        }
    }
    
    case left
    case right
}

struct SizedCircleView: View{
    let myColor: Color
    let mySize: Float
    let total: Float
    let offsetDirection: OffsetDirection
    
    @State private var isRotated = false
    @State var isAnimated: Bool = !UserDefaults.standard.bool(forKey: "noAnimation")
    
    
    var scaleFactor: Float {
        mySize / total }
    
    func findOffsetX(proxyWidth: CGFloat) -> CGFloat{
        return (proxyWidth/2 - (proxyWidth*CGFloat(scaleFactor))/2) * offsetDirection.modifier
        
    }
    
    var myAnimation: Animation {
        Animation.linear
            .speed(0.1)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            Circle()
                .scale(CGFloat(scaleFactor))
                .rotationEffect(Angle.degrees(isRotated ? 360 : 0))
//                .overlay(){
//                    RoundedRectangle(cornerRadius: 5)
//                        .scale(CGFloat(scaleFactor))
//                        .frame(height:10)
//                        .foregroundColor(.red)
//                }
                .offset(x: findOffsetX(proxyWidth: GeometryProxy.size.width))
                .foregroundColor(myColor)
                .onAppear {
                    withAnimation(myAnimation) {
                        isRotated.toggle()
                    }
                }

                                
        }
    }
}

struct SizeCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SizedCircleView(myColor: .green, mySize: 6, total: 7, offsetDirection: .right)
            SizedCircleView(myColor: .blue, mySize: 1, total: 7, offsetDirection: .left)
            SizedCircleView(myColor: .red, mySize: 5, total: 10, offsetDirection: .right)
        }
    }
}
