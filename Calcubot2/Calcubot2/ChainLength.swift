//
//  ChainLength.swift
//  Calcubot2
//
//  Created by Student on 2022-05-02.
//

import SwiftUI

struct ChainLength: View {
    var overlay: some View{
        Text("hello world")
            .foregroundColor(Color.lightGrey)
    }
    
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.myBackGround)
                .edgesIgnoringSafeArea(.all)
                .overlay(overlay)
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Chain Length").font(.largeTitle)
                                .foregroundColor(Color.lightGrey)
                    }
                }
        }
    }
}

struct ChainLength_Previews: PreviewProvider {
    static var previews: some View {
        ChainLength()
    }
}
