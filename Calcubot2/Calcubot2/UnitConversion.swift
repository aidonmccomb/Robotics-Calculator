//
//  SwiftUIView.swift
//  Calcubot2
//
//  Created by Student on 2022-04-20.
//

import SwiftUI

struct UnitConversion: View {
    //State variable dump
    //@State var pickerOne: MetDistUnits.AllCases
    @State var titleOne: String = "Metric"
    @State var unitOne: MetDistUnits = MetDistUnits.m
    @State var valueOne: String = ""
    @State var titleTwo: String = "Impreial"
    @State var unitTwo: ImpDistUnits = ImpDistUnits.inch
    @State var valueTwo: String = ""
    
    //operation function
    func Convert(){
        let Mediary = Float(valueOne)! * unitOne.conversionValue
        
        let Ans = Mediary / unitTwo.conversionValue
        
        valueTwo = String(Float(Ans))
    }
    //legacy button and fucntion, will be deleted later
    func ReverseConvert(){
        let Mediary = Float(valueTwo)! * unitTwo.conversionValue
        
        let Ans = Mediary / unitOne.conversionValue
        
        valueOne = String(Float(Ans))
    }
    
    func Swap(){
        //title swap
        let container = String(titleTwo)
        titleTwo =  String(titleOne)
        titleOne = container
        //swap pickers
        //profit??
    }
    
    var body: some View {
        VStack(alignment:.center, spacing: 10){
            HStack(alignment:.center, spacing: 10){
                Text(titleOne)
                Picker(titleOne, selection: $unitOne) {
                    ForEach(MetDistUnits.allCases, id: \.description) { i in
                        Text(String(i.description)).tag(i)
                    }
                }
                
                TextField("Value", text: $valueOne)
            }
            HStack(alignment:.center, spacing: 10){
                Text(titleTwo)
                Picker(titleTwo, selection: $unitTwo) {
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
            Button {
                ReverseConvert()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.pink)
                        .frame(width: 120, height: 40, alignment: .center)
                    Text("Rev. Conv.")
                        .foregroundColor(Color.pink)
                        .colorInvert()
                }
            }
            Button {
                Swap()
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(width: 120, height: 40, alignment: .center)
                    Text("Swap")
                        .foregroundColor(Color.orange)
                        .colorInvert()
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