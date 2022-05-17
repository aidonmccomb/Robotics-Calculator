import SwiftUI




struct testFile2: View {

    var overlay: some View {
        
        HStack(spacing: 0){
            Circle()
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
