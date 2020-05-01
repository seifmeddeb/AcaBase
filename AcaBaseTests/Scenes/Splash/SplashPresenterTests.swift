//
//  SplashPresenterTests.swift
//  AcaBase
//
//  Created by Seif eddinne meddeb on 5/1/20.
//  Copyright (c) 2020 Seif eddinne meddeb. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import AcaBase
import XCTest

class SplashPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: SplashPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupSplashPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupSplashPresenter()
  {
    sut = SplashPresenter()
  }
  
  // MARK: Test doubles
  
  class SplashDisplayLogicSpy: SplashDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: Splash.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = SplashDisplayLogicSpy()
    sut.viewController = spy
    let response = Splash.Something.Response()
    
    // When
    sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
