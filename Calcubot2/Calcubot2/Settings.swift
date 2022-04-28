//
//  Settings.swift
//  Calcubot2
//
//  Created by Student on 2022-04-26.
//

import SwiftUI

//make a myNavLink style struct for the checkbox and title structure

//attempt #1, doesnt work allow for toggling. need to make togglable acessible within checkBoxAndTitle's scope. 

//struct checkBoxAndTitle: View {
//    var togglable: Bool
//    let myColor: Color
//    let myTitle: String
//
//    mutating func toggle(){togglable = !togglable}
//
//    var body: some View {
//        HStack{
//            Button {toggle()} label: {
//                Image(systemName: togglable ? "checkmark.square": "square")
//            }
//            Text(myTitle)
//                .foregroundColor(myColor)
//        }
//
//    }
//}

struct Settings: View {
    //is it best practices to name Overlay with upper or lower cammel case?? the code isnt mutable but it is a var
    @State var highContrast: Bool = false
    @State var greyScale: Bool = false
    @State var noAnimation: Bool = false
    
    var Overlay: some View {
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
            HStack{
                Button {
                    highContrast = !highContrast
                } label: {
                    Image(systemName: highContrast ? "checkmark.square": "square")
                }
                Text("High Contrast")
                    .foregroundColor(Color.lightGrey)
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
