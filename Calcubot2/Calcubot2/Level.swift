//
//  Level.swift
//  Calcubot2
//
//  Created by Student on 2022-04-28.
//

import SwiftUI

 struct Level: View {
     @State var speed: Double = 180.0
     @State private var isEditing = false

     var overlay: some View {
         VStack{
             Text("Level")
                 .bold()
                 .foregroundColor(Color.lightGrey)
             ZStack{
                 Circle()
                     .foregroundColor(Color.white)
                     .frame(width: 300, height: 300, alignment: .center)
                 RoundedRectangle(cornerRadius: 5)
                     .foregroundColor(Color.red)
                     .rotationEffect(Angle(degrees: Double(speed)))
                     .frame(width: 280, height: 10, alignment: .center)
             }
             Slider(
                 value: $speed,
                 in: 0...360,
                 onEditingChanged: { editing in
                     isEditing = editing
                 }
             )
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
