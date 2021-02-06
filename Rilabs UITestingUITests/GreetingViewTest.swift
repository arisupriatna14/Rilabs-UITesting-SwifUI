//
//  GreetingViewTest.swift
//  Rilabs UITestingUITests
//
//  Created by Ari Supriatna on 06/02/21.
//

import XCTest
import ViewInspector

extension GreetingView: Inspectable { }

class GreetingViewTest: XCTestCase {

  func testGreetsGuestWithHelloWorld() throws {
    let userState = UserState(loggedIn: false)
    var subject = GreetingView()
    let exp = subject.on(\.didAppear) { (view) in
      XCTAssertEqual(try view.vStack().text(0).string(), "Hello, world!")
    }
    ViewHosting.host(view: subject.environmentObject(userState))
    wait(for: [exp], timeout: 0.1)
  }

  func testGreetsLoggedInWithUsername() throws {
    let userState = UserState(userName: "Ari", loggedIn: true)
    var subject = GreetingView()
    let exp = subject.on(\.didAppear) { (view) in
      XCTAssertEqual(try view.vStack().text(0).string(), "Hello, Ari!")
    }
    ViewHosting.host(view: subject.environmentObject(userState))
    wait(for: [exp], timeout: 0.1)
  }
  
  func testStateValueChangesWhenTapButtonLogout() throws {
    let userState = UserState(loggedIn: false)
    var sut = GreetingView()
    let exp = sut.on(\.didAppear) { (view) in
      XCTAssertFalse(try view.actualView().isLogout)
      try view.vStack().button(1).tap()
      XCTAssertTrue(try view.actualView().isLogout)
    }
    
    ViewHosting.host(view: sut.environmentObject(userState))
    wait(for: [exp], timeout: 0.1)
  }
}
