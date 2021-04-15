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
//
//    func testSignupFormModel_WhenValidLastNameProvided_ShouldReturnTrue() {
//
//        // ACT
//        let lastNameIsValid = sut.isLastNameValid(lastName: "Vazquez")
//
//        XCTAssertTrue(lastNameIsValid, "If isFirstNameValid() returns TRUE it is okay, Else if it returns FALSE, the it is emptey or too long")
//    }
//    func testSignupFormModel_WhenValidLastNameProvidedIsTooShort_ShouldReturnFalse() {
//        //ACT
//        let islastNameIsValid = sut.isLastNameValid(lastName: "Vaz")
//
//        // Assert
//        XCTAssertFalse(islastNameIsValid, "isFirstNameValid should return False if the last name is shorter than \(SignupConstants.lastNameMinLength)" )
//    }
//
//    func testSignupFormModel_WhenValidLastNameProvidedIsTooLong_ShouldReturnFalse() {
//        // ACT
//        let isLastNameValid = sut.isLastNameValid(lastName: "VazquezJordyVazquezJordyVazquez")
//
//        //Assert
//        XCTAssertFalse(isLastNameValid, "isFirstNameValid should return False if the last name is shorter than \(SignupConstants.lastNameMaxLength)")
//
//    }
//
//    func testingSingupFormModel_WhenEmailProvidedWithCorrectCredentials_ShouldRerturnTrue() {
//        // ACT
//        let isEmailValid = sut.isEmailValid(email: "jordy@test.com")
//
//        //Assert
//        XCTAssertTrue(isEmailValid, "The email provided should return true if has the correct credintials, if it returns false there is something worng with he email provided")
//    }
//
//    func testingSingupFormModel_WhenPasswordIsProvided_ShouldReturnTrue() {
//        // Act
//        let isValidPassword = sut.isPasswordValid(password:"123456")
//        //Assert
//        XCTAssertTrue(isValidPassword, "isPasswordValid() no password has been provided")
//    }
//
//    func testingSingupFormModel_WhenPasswordIsProvidedIsTooShort_ShouldReturnFalse() {
//        // Act
//        let isValidPassword = sut.isPasswordValid(password:"1234")
//
//        //Assert
//        XCTAssertFalse(isValidPassword, "isPasswordValid() if password provided is too short it should return false, else it shoudl return True if the password is long than the \(SignupConstants.passwordMinLength)")
//    }
//
//    func testingSingupFormModel_WhenPasswordIsProvidedIsTooLong_ShouldReturnFalse() {
//        // Act
//        let isValidPassword = sut.isPasswordValid(password:"123456789123456789876")
//        //Assert
//        XCTAssertFalse(isValidPassword, "isPasswordValid() password provided is too long it should return False, else it should return TRUE if the password is shorten than \(SignupConstants.passwordMaxLength)")
//    }

}
