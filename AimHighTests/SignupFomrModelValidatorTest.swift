//
//  HomeLoginViewController.swift
//  AimHighTests
//
//  Created by Jordy Vazquez on 3/29/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.


import XCTest
@testable import AimHigh

class SignupFomrModelValidatorTest: XCTestCase {

    var sut: SingupFormValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SingupFormValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testSignupFormValidator_WhenValidFirstNameProvided() {
        XCTAssertNoThrow(try sut.isFirstNamevalid(firstName: "JordyV"))
    }
    
    func testSignupFormValidator_WhenFirstNameProvided_IsNill(){
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isFirstNamevalid(firstName: nil)) {
            trownError in error = trownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func testSignupFormValidator_WhenValidFirstNameProvided_IsTooShort() {
        let expectedError = ValidationError.firstNameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isFirstNamevalid(firstName: "a")) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }

    func testSignupFormValidator_WhenValidFirstNameProvidedIsTooLong() {
        let expectedError = ValidationError.firstNameTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isFirstNamevalid(firstName: "This  first name is way too long")) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }

    func testSignupFormMValidator_WhenValidLastNameProvided() {
        
        XCTAssertNoThrow( try sut.isLastNameValid(lastName: "Vazquez"))

    }
    
    func testSignupFormValidator_WhenLastName_Is_Nill() {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isLastNameValid(lastName: nil)) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func testSignupFormMValidator_WhenValidLastNameProvidedIsTooShort() {
        let expectedError = ValidationError.lastNameTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isLastNameValid(lastName: "123")){
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
        
    }

    func testSignupFormMValidator_WhenValidLastNameProvidedIsTooLong_ShouldReturnFalse() {
      

    }

    func testingSingupFormMValidator_WhenEmailProvidedWithCorrectCredentials_ShouldRerturnTrue() {
    
    }

    func testingSingupFormMValidator_WhenPasswordIsProvided_ShouldReturnTrue() {

    }

    func testingSingupFormMValidator_WhenPasswordIsProvidedIsTooShort_ShouldReturnFalse() {
        
    }

    func testingSingupFormValidator_WhenPasswordIsProvidedIsTooLong_ShouldReturnFalse() {
  
    }

}
