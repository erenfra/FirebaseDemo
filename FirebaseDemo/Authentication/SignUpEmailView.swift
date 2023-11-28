//
//  SignUpEmailView.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 11/2/23.
//

import SwiftUI

@MainActor
final class SignUpWithEmail: ObservableObject {

  @Published var email = ""
  @Published var password = ""

  func signUp() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found!")
      return
    }
    let _ = try await AuthenticationManager.shared.createUser(email: email, password: password)

  }
}

struct SignUpEmailView: View {

  @StateObject private var viewModel = SignUpWithEmail()
  @Binding var showSignInView: Bool

    var body: some View {
      VStack {
        TextField("Email...", text: $viewModel.email)
          .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
          .padding()
          .background(Color.gray.opacity(0.2))
          .cornerRadius(10)
        SecureField("Password...", text: $viewModel.password)
          .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
          .padding()
          .background(Color.gray.opacity(0.2))
          .cornerRadius(10)
        Button{
          Task {
            do {
              try await viewModel.signUp()
              showSignInView = false
            } catch {
              print(error)
            }
          }

        } label: {
          Text("Sign up")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)

        }
        Spacer()

      }
      .padding()
      .navigationTitle("Sign up with Email")
    }
}

#Preview {
  NavigationStack {
    SignUpEmailView(showSignInView: .constant(false))
  }
}
