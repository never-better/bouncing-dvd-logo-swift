import Foundation
import SwiftUI

class DVDLogoViewModel:ObservableObject {
    
    @Published var x = 0
    @Published var y = 0
    @Published var red: Double = Double.random(in: 0.0...1.0)
    @Published var green: Double = Double.random(in: 0.0...1.0)
    @Published var blue: Double = Double.random(in: 0.0...1.0)
    @Published var opacity: Double = 1.0
    
    let dvdWidth:CGFloat = 100
    let dvdHeight:CGFloat = 100
    var xspeed = 1
    var yspeed = 1
  
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    func updateCoordinate(safeAreaInsetTop: Int, safeAreaInsetBottom: Int) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [self] in
            if(x + 100 > screenWidth || x < 0){
                xspeed *= -1
                setColor()
            }
            if(y + 100 > screenHeight - safeAreaInsetTop - safeAreaInsetBottom || y < 0){
                yspeed *= -1
                setColor()
            }
            x += xspeed
            y += yspeed
            updateCoordinate(safeAreaInsetTop: safeAreaInsetTop, safeAreaInsetBottom: safeAreaInsetBottom)
        }
        
    }
    
    func setColor() {
        red = Double.random(in: 0.0...1.0)
        green = Double.random(in: 0.0...1.0)
        blue = Double.random(in: 0.0...1.0)
        opacity = Double.random(in: 0.5...1.0)
    }
    
}
