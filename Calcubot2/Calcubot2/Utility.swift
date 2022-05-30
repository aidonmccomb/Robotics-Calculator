//
//  Utility.swift
//  Calcubot2
//
//  Created by Student on 2022-04-21.
//

import SwiftUI
import Foundation

//for Gear Ratio

class UserInputStages: ObservableObject {
    var StagesAdd: Int = 0
    
    @Published var Input: Array<String>
    @Published var Output: Array<String>
    
    @Published var Driving: String
    @Published var Driven: String
    
    @Published var Answer: String
    
    func AnswerFormatter() {
        //ifFunctionCalled = true
        
        var prodInput: Int = 1
        
        for num in Input {
            prodInput = prodInput * Int(num)!
        }
        
        var prodOutput: Int = 1
        
        for num in Output {
            prodOutput = prodOutput * Int(num)!
        }
        
        let gcd = GCD_Calculator(a: Int(prodInput), b: Int(prodOutput))
        
        self.Driving = String(prodInput / gcd)
        self.Driven = String(prodOutput / gcd)
        
        self.Answer = "\(Driving) : \(Driven)"
    }
    
    func GCD_Calculator(a: Int, b: Int) -> Int{
        if(b == 0)
        {
            return a;
        }
        return GCD_Calculator(a: b, b: a % b);
    }
    
    func StageAdded(){
        self.StagesAdd += 1
        
        self.Input.append("")
        self.Output.append("")
        
    }
    
    func StageRemoved() {
        self.StagesAdd -= 1
        
        self.Input.removeLast()
        self.Output.removeLast()
        
    }
    
    init(){
        self.StagesAdd += 1
        
        self.Input = [""]
        self.Output = [""]
        
        self.Driving = ""
        self.Driven = ""

        self.Answer = "Final Ratio"
    }

}

//for Gear Ratio

struct RotatingCircleView: View {
    @State private var isRotated = false
    let fill: Color
    let scale: CGFloat
    let direction: Direction

    var animation: Animation {
        Animation.linear
            .speed(scale / 1.5)
            .repeatForever(autoreverses: false)
    }

    var overlay: some View {
        Rectangle()
            .fill(.gray)
            .frame(height: 5)
    }

    var body: some View {
        let (upperRot, lowerRot) =  rotationDecider()
        
        GeometryReader { proxy in
            Circle()
                .fill(fill)
                .overlay(overlay)
                .rotationEffect(Angle.degrees(isRotated ? upperRot : lowerRot))
                .scaleEffect(scale)
                .offset(x: xOffset(for: proxy.size.width), y: 0)
                .onAppear {
                    withAnimation(animation) {
                        isRotated.toggle()
                    }
                }
        }
    }

    private func rotationDecider() -> (Double, Double) {
        if direction == .right {
            return(360, 0)
        }
        else {
            return (0, 360)
        }
    }
    
    private func xOffset(for width: CGFloat) -> CGFloat {
        direction.value*(width/2-(width/2*scale))
    }
}

//placeholder
