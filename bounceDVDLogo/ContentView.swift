import SwiftUI

struct DVDLogoView: View {
    
    @EnvironmentObject private var vm: DVDLogoViewModel
    
    var body: some View {
            GeometryReader { geomertry in
                Color.black.opacity(0.9).ignoresSafeArea(.all)
                
                ZStack(alignment: .topLeading){
                    Color.black
                    
                    ZStack{
                        Color(red: vm.red, green: vm.green, blue: vm.blue, opacity: vm.opacity)
                        
                        Image("DVDLogo")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: vm.dvdWidth, height: vm.dvdHeight)
                            .foregroundColor(.black)
                        
                    }
                    .frame(width: vm.dvdWidth, height: vm.dvdHeight)
                    .offset(x: CGFloat(vm.x) , y: CGFloat(vm.y))
                }
                .onAppear() {
                    vm.updateCoordinate(safeAreaInsetTop: Int(geomertry.safeAreaInsets.top), safeAreaInsetBottom: Int(geomertry.safeAreaInsets.bottom))
                }
            }
    }
}

struct DVDLogoView_Previews: PreviewProvider {
    static var previews: some View {
        DVDLogoView()
            .environmentObject(DVDLogoViewModel())
    }
}
