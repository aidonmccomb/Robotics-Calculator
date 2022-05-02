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

class userSettings: ObservableObject{
    @Published var highContrast: Bool {
        didSet {
            UserDefaults.standard.set(highContrast, forKey: "highContrast")
        }
    }
    @Published var greyScale: Bool {
        didSet {
            UserDefaults.standard.set(greyScale, forKey: "greyScale")
        }
    }
    @Published var noAnimation: Bool {
        didSet {
            UserDefaults.standard.set(noAnimation, forKey: "noAnimation")
        }
    }
    
    init(highContrast: Bool, greyScale: Bool, noAnimation: Bool) {
        self.highContrast = false
        self.greyScale = false
        self.noAnimation = false
    }
}

struct Settings: View {
    
    @ObservedObject var userPrefences = userSettings()
    
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
            checkBoxAndTitle(togglable: $userPrefences.highContrast, myColor: Color.lightGrey, myTitle: "High Contrast")
                .padding()
            
            checkBoxAndTitle(togglable: $userPrefences.greyScale, myColor: Color.lightGrey, myTitle: "Grey Scale")
                .padding()
            checkBoxAndTitle(togglable: $userPrefences.noAnimation, myColor: Color.lightGrey, myTitle: "No Animation")
                .padding()
            
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
