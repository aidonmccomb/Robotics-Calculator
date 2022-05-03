//
//  BeltCentering.swift
//  Calcubot2
//
//  Created by Student on 2022-05-03.
//

import SwiftUI

enum Belts: CustomStringConvertible, CaseIterable{
    var description: String{
        switch self{
        case .mmfive : return "25"
        case .mmsix : return "25H"
        case .mmseven : return "35"
        }
    }
    var pitch: Float{
        switch self{
        case .mmfive: return 0.250
        case .mmsix: return 0.250
        case .mmseven : return 0.375
        }
    }
    case mmfive
    case mmsix
    case mmseven
}


struct BeltCentering: View {
    var overlay: some View{
        Text("Bruh")
            .foregroundColor(Color.lightGrey)
    }
    var body: some View {
        Rectangle().fill(Color.myBackGround)
            .edgesIgnoringSafeArea(.all)
            .overlay(overlay)
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Settings").font(.largeTitle)
                            .foregroundColor(Color.lightGrey)
                    }
                }
                
            }
    }
}

struct BeltCentering_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BeltCentering()
        }
    }
}
