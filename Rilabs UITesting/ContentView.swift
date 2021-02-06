//
//  ContentView.swift
//  Rilabs UITesting
//
//  Created by Ari Supriatna on 06/02/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        Text("Hello, world!")
        Text("Hello, ari!")
        GreetingView()
        NavigationLink(destination: CustomTextFieldView()) {
          Text("Masuk Detail Page")
        }
        .accessibilityIdentifier("tapNavigateToDetailPage")
      }
      .padding()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

class UserState: ObservableObject {
  @Published var loggedIn: Bool
  @Published var userName: String
  
  init(userName: String = "", loggedIn: Bool = false) {
    self.userName = userName
    self.loggedIn = loggedIn
  }
}

struct GreetingView: View {
  
  @State var isLogout: Bool = false
  @EnvironmentObject var userState: UserState
  // MARK: for ViewInspector testing purpose
  internal var didAppear: ((Self) -> Void)?
  
  var body: some View {
    VStack {
      if userState.loggedIn {
        Text("Hello, \(userState.userName)!")
      } else {
        Text("Hello, world!")
      }
      Button {
        self.isLogout.toggle()
      } label: {
        Text("Logout")
      }
    }
    .onAppear {
      // MARK: for ViewInspector testing purpose
      self.didAppear?(self)
    }
  }
}
