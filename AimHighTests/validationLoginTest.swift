//
//  validationLoginTest.swift
//  AimHighTests
//
//  Created by Jordy Vazquez on 4/8/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import XCTest
@testable import AimHigh
class validationLoginTest: XCTestCase {
    
    var validation: SignInValidationService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        validation = SignInValidationService()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validation = nil
        super.tearDown()
    }
    
    func test_Is_Password_Valid() throws {
        XCTAssertNoThrow(try validation.validatePassword(password: "abc@1234ee"))
    }
    
    func test_Is_Password_Nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: nil)) {
            thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    func test_Is_password_Too_Short() throws {
        let expectedError = ValidationError.passwordTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: "abc")){
            throwError in error = throwError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_Is_password_Too_Long() throws {
        let expectedError = ValidationError.passwordTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: "This password Should Be Too Long")){
            throwError in error = throwError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
//    func  test_Login_Button_Tapped() {
//        let sut =
//    }
}
