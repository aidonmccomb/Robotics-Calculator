//
//  Settings.swift
//  Calcubot2
//
//  Created by Student on 2022-04-26.
//

import SwiftUI

//make a myNavLink style struct for the checkbox and title structure

//attempt #1, doesnt work allow for toggling. need to make togglable acessible within checkBoxAndTitle's scope. 

struct checkBoxAndTitle: View {
    @Binding var togglable: Bool
    let myColor: Color
    let myTitle: String

    var body: some View {
        HStack{
            Button {togglable.toggle()} label: {
                Image(systemName: togglable ? "checkmark.square": "square")
            }
            Text(myTitle)
                .foregroundColor(myColor)
        }

    }
}

class storeableBool: ObservableObject{
    @Published var highContrast: Bool = false {
        didSet {
            UserDefaults.standard.set(highContrast, forKey: "highContrast")
        }
    }
    @Published var greyScale: Bool = false
    @Published var noAnimation: Bool = false
    
    //UserDefaults.standard.set(true, forKey: "Key")
}

struct Settings: View {

    @ObservedObject var userPrefences = storeableBool()
    
    var overlay: some View {
        //storing propreties of the users preferences
        //Visual options mostly : High Contrast, Grey Scale, No animation,
        VStack{
            Text("Visual Settings")
                .padding()
                .background{
                    Rectangle()
                        .fill(Color.myBorder)
                }
                .foregroundColor(Color.lightGrey)
            checkBoxAndTitle(togglable: $userPrefences.greyScale, myColor: Color.lightGrey, myTitle: "Grey Scale")
        }
    }
    var body: some View {
        NavigationView {
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
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
