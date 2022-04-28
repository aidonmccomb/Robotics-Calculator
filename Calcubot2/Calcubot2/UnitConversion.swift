//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

//want to make it impossible to enter text into answer feild

struct UnitConversion: View {
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
        
        guard let floatValOne = Float(valueOne) else {
            valueOne = ""
            valueTwo = ""
            return }

        let conversionValueOne: Float
        let conversionValueTwo: Float
        
        if isFlipped {
            conversionValueOne = unitOne.conversionValue
            conversionValueTwo = unitTwo.conversionValue
        } else {
            conversionValueOne = unitTwo.conversionValue
            conversionValueTwo = unitOne.conversionValue
        }
        
        let Mediary = floatValOne * conversionValueOne
        
        let Ans = Mediary / conversionValueTwo
        
        valueTwo = String(Float(Ans))
    }
    var overlay: some View {
        VStack{
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
                //Text("Slider")
            }
            //if statement start
            if isFlipped {
                HStack(alignment:.center, spacing: 10){
                    Text("Metric")
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                    Picker("Metric", selection: $unitOne) {
                        ForEach(MetDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    
                    TextField("Value", text: $valueOne)
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(Color.red)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                }
                HStack(alignment:.center, spacing: 10){
                    Text("Impreial")
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                    Picker("Impreial", selection: $unitTwo) {
                        ForEach(ImpDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Answer", text: $valueTwo)
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(Color.red)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                }
                
            } else { //else statement start
                HStack(alignment:.center, spacing: 10){
                    Text("Impreial")
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                    Picker("Impreial", selection: $unitTwo) {
                        ForEach(ImpDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Value", text: $valueOne)
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(Color.red)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                }
                HStack(alignment:.center, spacing: 10){
                    Text("Metric")
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                    Picker("Metric", selection: $unitOne) {
                        ForEach(MetDistUnits.allCases, id: \.description) { i in
                            Text(String(i.description)).tag(i)
                        }
                    }
                    TextField("Answer", text: $valueTwo)
                        .keyboardType(.numbersAndPunctuation)
                        .foregroundColor(Color.red)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.lightGrey)
                        }
                        .padding()
                }
                
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
        }
    }
    var body: some View {
        NavigationView {
            Rectangle().fill(Color.myBackGround)
                .edgesIgnoringSafeArea(.all)
                .overlay(overlay)
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Unit Conversion").font(.largeTitle)
                                .foregroundColor(Color.lightGrey)
                    }
                }
        }
    }
}

struct UnitConversion_Previews: PreviewProvider {
    static var previews: some View {
        UnitConversion()
    }
}
