//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

class Vehicle {
    var isRoadLegal : Bool
    var wheelCount : Int
    
    init(isRoadLegal: Bool, wheelCount: Int){
        self.isRoadLegal = isRoadLegal
        self.wheelCount = wheelCount
    }
}

//super???

//class Car: Vehicle{
//    var isSportsCar: Bool
//    var color: Color
//
//    init(isRoadLegal: Bool, wheelCount: Int, isSportsCar: Bool, color: Color) {
//        super.init(isRoadLegal: Bool, wheelCount: Int) {
//        super.self.isRoadLegal = true
//        super.self.wheelCount = 4
//        }
//        self.isSportsCar = isSportsCar
//        self.color = color
//    }
//}

struct testFile: View {
    var body: some View {
        Text("test file")
    }
}


struct testFile_Previews: PreviewProvider {
    static var previews: some View {
        testFile()
    }
}
