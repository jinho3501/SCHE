
import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?

    init() {
        self.user = Auth.auth().currentUser

        // 로그인 상태 변화 감지
        Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("로그아웃 실패: \(error.localizedDescription)")
        }
    }
}
