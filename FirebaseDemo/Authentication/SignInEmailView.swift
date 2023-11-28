//
//  SignInEmailView.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 10/31/23.
//

import SwiftUI

@MainActor
final class SignInWithEmail: ObservableObject {

  @Published var email = ""
  @Published var password = ""

  func signIn() async throws {
    guard !email.isEmpty, !password.isEmpty else {
      print("No email or password found!")
      return
    }
    let _ = try await AuthenticationManager.shared.signInUser(email: email, password: password)

  }
}

struct SignInEmailView: View {

  @StateObject private var viewModel = SignInWithEmail()
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
              try await viewModel.signIn()
              showSignInView = false
            } catch {
              print(error)
            }
          }

        } label: {
          Text("Sign in")
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
      .navigationTitle("Sign in with Email")
    }
}

#Preview {
  NavigationStack {
    SignInEmailView(showSignInView: .constant(false))
  }
}
