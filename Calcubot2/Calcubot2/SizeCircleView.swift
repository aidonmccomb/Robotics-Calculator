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
            Circle()
                .scale(CGFloat(scaleFactor))
                .fill(myColor)
                .onAppear{
                    print(GeometryProxy.size)
                }
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                }
        }
    }
}

struct SizeCircleView_Previews: PreviewProvider {
    static var previews: some View {
        SizedCircleView(myColor: .green, mySize: 6, total: 7)
    }
}
