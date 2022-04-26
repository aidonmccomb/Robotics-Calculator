//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

struct testFile: View {
    //State variable dump
    @State private var isFlipped = true
    
    @State var unitOne: MetDistUnits = MetDistUnits.cm
    @State var valueOne: String = ""
    @State var unitTwo: ImpDistUnits = ImpDistUnits.inch
    @State var valueTwo: String = ""
    
    //swap function
    func FunctionSwap(){
        isFlipped.toggle()
        valueOne = ""
        valueTwo = ""
        unitOne = MetDistUnits.cm
        unitTwo = ImpDistUnits.inch
    }
    
    //operation function
    func Convert(){
        let Mediary = Float(valueOne)! * unitOne.conversionValue
        
        let Ans = Mediary / unitTwo.conversionValue
        
        valueTwo = String(Float(Ans))
    }
    //want to find way to get rid of this
    func SwappedConvert(){
        let Mediary = Float(valueOne)! * unitTwo.conversionValue
        
        let Ans = Mediary / unitOne.conversionValue
        
        valueTwo = String(Float(Ans))
    }
    
    var body: some View {
        VStack(alignment:.center, spacing: 10){
            HStack {
                //swap Impreial and Metric button
                Button {
                    FunctionSwap()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.teal)
                            .frame(width: 120, height: 40, alignment: .center)
                        Text("Swap")
                            .foregroundColor(Color.red)
                    }
                }
            }
            //if statement start
            if isFlipped {
                HStack(alignment:.center, spacing: 10){
                    Text("Metric")
                    Picker("Metric", selection: $unitOne) {
                        ForEach(MetDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    
                    TextField("Value", text: $valueOne)
                }
                HStack(alignment:.center, spacing: 10){
                    Text("Impreial")
                    Picker("Impreial", selection: $unitTwo) {
                        ForEach(ImpDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Answer", text: $valueTwo)
                }
                Button {
                    Convert()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .frame(width: 120, height: 40, alignment: .center)
                        Text("Convert")
                            .foregroundColor(Color.green)
                            .colorInvert()
                    }
                }
            } else { //else statement start
                HStack(alignment:.center, spacing: 10){
                    Text("Impreial")
                    Picker("Impreial", selection: $unitTwo) {
                        ForEach(ImpDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Value", text: $valueOne)
                }
                HStack(alignment:.center, spacing: 10){
                    Text("Metric")
                    Picker("Metric", selection: $unitOne) {
                        ForEach(MetDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Answer", text: $valueTwo)
                }
                Button {
                    SwappedConvert()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .frame(width: 120, height: 40, alignment: .center)
                        Text("Convert")
                            .foregroundColor(Color.green)
                            .colorInvert()
                    }
                }
            }
        }
    }
}

struct testFile_Previews: PreviewProvider {
    static var previews: some View {
        testFile()
    }
}
