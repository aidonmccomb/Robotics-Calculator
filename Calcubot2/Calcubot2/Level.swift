//
//  Level.swift
//  Calcubot2
//
//  Created by Student on 2022-04-28.
//
import Foundation
import SwiftUI
import CoreMotion

//class motionManager:  {
//    let motion = CMMotionManager()
//}

struct Level: View {
    @State var speed: Double = 180.0
    @State private var isEditing = false
    
    //need to access gyro
    func updateLevel() {
        
    }
    
    var overlay: some View {
        VStack{
            Text("90")
                .bold()
                .foregroundColor(Color.lightGrey)
            HStack{
                Text("180")
                    .foregroundColor(Color.lightGrey)
                ZStack{
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: 300, height: 300, alignment: .center)
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color.red)
                        .rotationEffect(Angle(degrees: Double(speed)))
                        .frame(width: 280, height: 10, alignment: .center)
                }.padding()
                Text(" 0 ")
                    .foregroundColor(Color.lightGrey)
            }
            //will be depricated once gyro functionality is added
            Text("270")
                .foregroundColor(Color.lightGrey)
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.myOrange)
                    .frame(width: 360, height: 15, alignment: .center)
                    .overlay {
                        Slider(
                            value: $speed,
                            in: 0...360,
                            onEditingChanged: { editing in
                                isEditing = editing})
                    }
            }.padding()
        }
        
        
    }
    
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.myBackGround)
                .edgesIgnoringSafeArea(.all)
                .overlay(overlay)
        }
    }
}

struct Level_Previews: PreviewProvider {
    static var previews: some View {
        Level()
    }
}
