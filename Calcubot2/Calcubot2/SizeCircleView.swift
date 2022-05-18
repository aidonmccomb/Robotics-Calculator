//
//  SizeCircleView.swift
//  Calcubot2
//
//  Created by Student on 2022-05-17.
//

import SwiftUI

struct SizedCircleView: View{
    let myColor: Color
    let mySize: Float
    let total: Float
    
    var scaleFactor: Float {
        mySize / total }
    
    var body: some View {
        GeometryReader { GeometryProxy in
            Rectangle()
                .size(width: GeometryProxy.size.width, height: GeometryProxy.size.width)
                .scale(CGFloat(scaleFactor))
                .fill(myColor)
                //line overlay to tell rotation
//                .overlay(){
//                    RoundedRectangle(cornerRadius: 5)
//                        .scale(CGFloat(scaleFactor))
//                        .fill(.red)
//                        .frame(width: CGFloat(GeometryProxy.size.width), height: 15)
//                }
        }
    }
}

struct SizeCircleView_Previews: PreviewProvider {
    static var previews: some View {
        SizedCircleView(myColor: .green, mySize: 6, total: 7)
    }
}
