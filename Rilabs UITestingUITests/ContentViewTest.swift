//
//  ContentViewTest.swift
//  Rilabs UITestingUITests
//
//  Created by Ari Supriatna on 06/02/21.
//

import XCTest
import ViewInspector

extension ContentView: Inspectable { }

class ContentViewTest: XCTestCase {
  
  func testExample() throws {
    let subject = ContentView()
    let text1 = try subject.inspect().navigationView().vStack(0).text(0).string()
    let text2 = try subject.inspect().navigationView().vStack(0).text(1).string()

    XCTAssertEqual(text1, "Hello, world!")
    XCTAssertEqual(text2, "Hello, ari!")
  }
  
  func testContaintsGreetingsView() throws {
    let subject = ContentView()
    let greetingView = try subject.inspect().vStack().view(GreetingView.self, 2)
    
    XCTAssertNotNil(greetingView)
  }
  
}
