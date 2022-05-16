import SwiftUI



struct testFile2: View {
    
    var gearOne: some View =
        Circle()
            .foregroundColor(Color.blue)
            .opacity(0.75)
            .frame(alignment: .center)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.red)
                    .frame(height: 15, alignment: .center)
                    .opacity(0.5)
                
            }
        
    
    
    var overlay: some View {
        ZStack() {
            Rectangle()
                .fill(Color.myOrange)
                .frame(width: 350, height: 200)
                .overlay {
                    GeometryReader { GeoProx in
                        HStack{
                            gearOne
                            Circle()
                                .size(width: GeoProx.size.width/2, height: GeoProx.size.height/2)
                                .fill(Color.blue)
                                .opacity(0.5)
                        }
                    }.padding()
                }
            
        }
        
        
    }
    
    var body: some View {
        Rectangle().fill(Color.myBackGround)
            .edgesIgnoringSafeArea(.all)
            .overlay(overlay)
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Geomentry Reader").font(.largeTitle)
                        .foregroundColor(Color.lightGrey)
                }
            }
    }
}

struct testFile2_prev: PreviewProvider {
    static var previews: some View {
        NavigationView {
            testFile2()
        }
    }
}
