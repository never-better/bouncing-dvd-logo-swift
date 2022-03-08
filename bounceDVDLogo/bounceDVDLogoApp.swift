import SwiftUI

@main
struct bounceDVDLogoApp: App {
    
    @StateObject private var vm = DVDLogoViewModel()
    
    var body: some Scene {
        WindowGroup {
            DVDLogoView()
                .environmentObject(vm)
        }
    }
}
