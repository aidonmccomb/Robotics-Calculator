//
//  Calcubot2App.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

extension Color {
    static let myBackGround = Color("BackGround")
    static let myAccent = Color(red: 20.0, green: 40.0, blue: 60.0)
    static let myButton = Color(red: 45.0, green: 10.0, blue: 200.0)
}

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}

@main
struct Calcubot2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
