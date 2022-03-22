import SwiftUI

struct SplashScreen<Content: View,Title: View,Logo: View>: View {
    var content: Content
    var titleView: Title
    var logoView: Logo
    
    var imageSize: CGSize
    
    init(imageSize: CGSize,@ViewBuilder content: @escaping () -> Content,@ViewBuilder titleView: @escaping () -> Title, @ViewBuilder logoView: @escaping () -> Logo){
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
    }
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    
    @Namespace var animation
    
    var body: some View{
    VStack(spacing: 0){
        ZStack{
            Color("Purple")
                .background(Color("Purple"))
            titleView.offset(y: textAnimation ? 0 : 108)
            if !imageAnimation {
                logoView
                    .matchedGeometryEffect(id: "LOGO", in: animation)
                    .frame(width: imageSize.width, height: imageSize.height)
            }
            
            HStack{
                Spacer()
                if imageAnimation {
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: 30, height: 30)
                }
            }
            
        }
    }
    .onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            withAnimation(.spring()){
                textAnimation.toggle()
            }
            withAnimation(Animation.easeIn(duration: 1.5)){
                imageAnimation.toggle()
            }
        }
    }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
