//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

struct testFile: View {
    var body: some View {
        VStack {
            Text("Hello Caplse")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.purple)
                .padding()
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color.purple, style: StrokeStyle(lineWidth: 5))
                )
            Text("Hello Rectangle")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .frame(width: 150, height: 150)
                    .padding()
                RoundedRectangle(cornerRadius: 20)
                    .size(width: 150, height: 150)
                    .stroke(lineWidth: 5)
                Text("text")
                    .foregroundColor(.red)
            }
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .frame(width: 150, height: 150)
                    
                    .padding()
                Text("text")
                    .foregroundColor(.red)
            }
        }
    }
}

struct testFile_Previews: PreviewProvider {
    static var previews: some View {
        testFile()
    }
}
