//
//  Rilabs_UITestingApp.swift
//  Rilabs UITesting
//
//  Created by Ari Supriatna on 06/02/21.
//

import SwiftUI

@main
struct Rilabs_UITestingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
              .environmentObject(UserState())
        }
    }
}
