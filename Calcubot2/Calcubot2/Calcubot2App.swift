//
//  Calcubot2App.swift
//  Calcubot2
//
//  Created by Student on 2022-04-19.
//

import SwiftUI

extension Color {
    static let myBackGround = Color("darkGrey")
    static let medGrey = Color("medGrey")
    static let myBorder = Color("jungleGreen")
    static let myButton = Color("limeGreen")
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
