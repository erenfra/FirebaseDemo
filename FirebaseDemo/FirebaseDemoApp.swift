//
//  FirebaseDemoApp.swift
//  FirebaseDemo
//
//  Created by Renato Oliveira Fraga on 10/31/23.
//

import SwiftUI
import Firebase

@main
struct FirebaseDemoApp: App {
  init() {
    FirebaseApp.configure()
    print("Configured Firebase!")
  }
    var body: some Scene {
        WindowGroup {
          RootView()
        }
    }
}
