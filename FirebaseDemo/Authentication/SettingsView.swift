//
//  SettingsView.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 11/1/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {

  func signOut() throws {
    try AuthenticationManager.shared.signOut()
  }

  func resetPassword() async throws {
    let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
    guard let email = authUser.email else {
      throw URLError(.fileDoesNotExist)
    }
    try await AuthenticationManager.shared.resetPassword(email: email)
  }
}

struct SettingsView: View {

  @StateObject private var viewModel = SettingsViewModel()
  @Binding var showSignInView: Bool

    var body: some View {
      List {
        Button("Log Out") {
          do {
            try viewModel.signOut()
            showSignInView = true
          } catch {
            print(error)
          }
        }
        Button("Reset Password") {
          Task {
            do {
              try await viewModel.resetPassword()
              print("PASSWORD RESET!")
            } catch {
              print(error)
            }
          }
        }
        Button("Update Password") {
          Task {
            do {
              try await viewModel.resetPassword()
              print("PASSWORD RESET!")
            } catch {
              print(error)
            }
          }
        }
      }
      .navigationBarTitle("Settings")
    }
}

#Preview {
  NavigationStack {
    SettingsView(showSignInView: .constant(false))
  }
}

