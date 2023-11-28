//
//  RootView.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 11/1/23.
//

import SwiftUI

struct RootView: View {

  @State private var showSignInView: Bool = false

    var body: some View {
      ZStack {
        NavigationStack {
          SettingsView(showSignInView: $showSignInView)
        }
      }
      .onAppear {
        let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
        self.showSignInView = authUser == nil
      }
      .fullScreenCover(isPresented: $showSignInView) {
        NavigationStack {
          AuthenticationView(showSignInView: $showSignInView)
        }
      }
    }
}

#Preview {
    RootView()
}
