//
//  ContentView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

struct MyNavigationLink<Destination: View>: View {
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
            MyNavigationLink(
                text: "Gear Ratio",
                textColor: .blue,
                backGround: .green
            ) {
                GearRatio()
            }
            MyNavigationLink(
                text: "Unit Conversion",
                textColor: .blue,
                backGround: .green
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
                        Button {
                            //modal settings?
                        } label: {
                            Image(systemName:"gearshape.fill")
                                .foregroundColor(Color.green)
                        }
                        
                    }
                }
            
        }
    }
}

struct Settings: View {
    var body: some View {
        VStack {
            Text("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
