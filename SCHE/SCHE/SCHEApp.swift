import SwiftUI
import Firebase

@main
struct SCHEApp: App {
    @StateObject var authViewModel = AuthViewModel()

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if authViewModel.user != nil {
                SCHETabView() 
            } else {
                LoginView()
            }
        }
    }
}
