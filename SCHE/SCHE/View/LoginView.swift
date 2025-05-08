import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        VStack(spacing: 20) {
            TextField("이메일", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)

            SecureField("비밀번호", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.footnote)
            }

            HStack {
                Button("로그인") {
                    viewModel.login()
                }
                .padding()

                Button("회원가입") {
                    viewModel.register()
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
