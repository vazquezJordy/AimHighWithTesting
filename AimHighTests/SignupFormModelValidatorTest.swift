//
//  HomeLoginViewController.swift
//  AimHighTests
//
//  Created by Jordy Vazquez on 3/29/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.


import XCTest
@testable import AimHigh

class SignupFormModelValidatorTest: XCTestCase {

    var sut: SignupFormValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormValidator()
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

    func testSignupFormMValidator_WhenValidLastNameProvidedIsTooLong() {
        let expectedError = ValidationError.lastNameTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isLastNameValid(lastName: "This is too long Do do nor accept it")) {
            thrownError in error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)

    }

    func testingSingupFormMValidator_WhenEmailProvidedWithCorrectCredentials() {
        
        var emailValidation = sut.isEmailValid(email: "jordy.vazquez@gmail.com")
        
        XCTAssertTrue(emailValidation, "If it returns FALSE the requirements for email are not being met")
    
    }

    func test_Is_Password_Valid() throws {
        XCTAssertNoThrow(try sut.isPasswordValid(password: "abc@1234ee"))
    }
    
    func test_Is_Password_Nil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isPasswordValid(password: nil)) {
            thrownError in
            error = thrownError as? ValidationError
        }
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    func test_Is_password_Too_Short() throws {
        let expectedError = ValidationError.passwordTooShort
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isPasswordValid(password: "abc")){
            throwError in error = throwError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }
    
    func test_Is_password_Too_Long() throws {
        let expectedError = ValidationError.passwordTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try sut.isPasswordValid(password: "1234567901234567890123")) {
            throwError in error = throwError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }

}
