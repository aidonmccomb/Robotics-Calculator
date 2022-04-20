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
                    .padding()
                Text(text)
                    .foregroundColor(textColor)
            }
        }
    }
}

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 150, maximum: 200)), count: 2)
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 10) {
                MyNavigationLink(
                    text: "Title",
                    textColor: .blue,
                    backGround: .green
                ) {
                    GearRatio()
                }
                MyNavigationLink(
                    text: "Title",
                    textColor: .blue,
                    backGround: .green
                ) {
                    Text("4/20 lol")
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
