//
//  CustomTextFieldView.swift
//  Rilabs UITesting
//
//  Created by Ari Supriatna on 07/02/21.
//

import SwiftUI

struct CustomTextFieldView: View {
  @State private var name: String = ""
  
  private var greeterText: String {
    name.isEmpty ? "" : "Nice to meet you, \(name)"
  }
  
  var body: some View {
    VStack {
      Text("Please enter your name below")
        .accessibilityIdentifier("enterNameLabel")
      TextField("Your name", text: $name)
      Text(greeterText)
        .accessibilityIdentifier("greetingTextLabel")
    }
    .padding()
  }
}

struct CustomTextFieldView_Previews: PreviewProvider {
  static var previews: some View {
    CustomTextFieldView()
  }
}
