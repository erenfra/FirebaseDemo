//
//  AuthenticationView.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 10/31/23.
//

import SwiftUI

struct AuthenticationView: View {
  @Binding var showSignInView: Bool

    var body: some View {
      VStack(spacing: 20) {
        NavigationLink {
          SignInEmailView(showSignInView: $showSignInView)
        } label: {
          Text("Sign in with Email")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)

        }
        Text("Don't have access yet?")
          .font(.subheadline)
        
        NavigationLink {
          SignUpEmailView(showSignInView: $showSignInView)
        } label: {
          Text("Sign up with Email")
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
      .navigationTitle("Firebase")
    }
}

#Preview {
  NavigationStack {
    AuthenticationView(showSignInView: .constant(false))
  }
}
