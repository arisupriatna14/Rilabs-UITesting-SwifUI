//
//  CustomTextFieldViewTest.swift
//  Rilabs UITestingUITests
//
//  Created by Ari Supriatna on 07/02/21.
//

import XCTest

class CustomTextFieldViewTest: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testInitialViewState() throws {
    let app = XCUIApplication()
    app.launch()
    
    app.buttons["tapNavigateToDetailPage"].tap()
    
    let textField = app.textFields.element
    let enterNameLabel = app.staticTexts["enterNameLabel"]
    let greetingTextLabel = app.staticTexts["greetingTextLabel"]
    
    XCTAssert(enterNameLabel.exists)
    XCTAssertEqual(enterNameLabel.label, "Please enter your name below")
    
    XCTAssert(greetingTextLabel.exists)
    XCTAssert(greetingTextLabel.label.isEmpty)
    
    XCTAssert(textField.exists)
    XCTAssertEqual(textField.placeholderValue, "Your name")
  }
  
  func testGreeter() throws {
    let app = XCUIApplication()
    app.launch()
    
    app.buttons["tapNavigateToDetailPage"].tap()
    
    let textLabel = app.staticTexts["greetingTextLabel"]
    let textfield = app.textFields.element
    
    textfield.tap()
    textfield.typeText("A")
    textfield.typeText("r")
    textfield.typeText("i")
    textfield.typeText("s")
    
    XCTAssertEqual(textLabel.label, "Nice to meet you, Aris")
  }
  
  func getScreenshot() {
    let app = XCUIApplication()
    let screenshot = app.screenshot()
    let attachment = XCTAttachment(screenshot: screenshot)
    attachment.name = "My Great Screenshot"
    attachment.lifetime = .keepAlways
    add(attachment)
  }
  
}
