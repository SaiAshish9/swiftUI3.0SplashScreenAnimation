import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imageSize: CGSize(width: 120, height: 120)) {
            
        } titleView: {
           Text("Sai")
                .font(.system(size: 35).bold())
                .foregroundColor(.white)
        }
        logoView : {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 120)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
