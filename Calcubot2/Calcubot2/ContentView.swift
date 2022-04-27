//
//  ContentView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

struct RoundedRectNavLink<Destination: View>: View {
    let text: String
    let textColor: Color
    let backGround: Color
    @ViewBuilder let destination: Destination
    var body: some View {
        NavigationLink(destination: destination){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(backGround)
                    .frame(width: 150, height: 150)
                    .addBorder(textColor, width: 3, cornerRadius: 20)
                    .padding()
                Text(text)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
        }
    }
}

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 2)
    var Overlay: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            RoundedRectNavLink(
                text: "Gear Ratio",
                textColor: .myBorder,
                backGround: .myButton
            ) {
                GearRatio()
            }
            RoundedRectNavLink(
                text: "Unit Conversion",
                textColor: .myBorder,
                backGround: .myButton
            ) {
                UnitConversion()
            }
            
        }
    }
    
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.myBackGround)
                .edgesIgnoringSafeArea(.all)
                .overlay(Overlay)
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Text("icon")
                            Text("Calcubot").font(.largeTitle)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: Settings()){
                            Image(systemName:"gearshape.fill")
                                .foregroundColor(Color.myBorder)
                        }
                        
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
