//
//  HomeLoginViewController.swift
//  AimHighTests
//
//  Created by Jordy Vazquez on 3/29/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import XCTest
@testable import AimHigh

class SignupFomrModelValidatorTest: XCTestCase {
    
    var sut: SingupFormModelValidator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SingupFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    func testSignupFormMode_WhenValidFirstNameProvided_ShouldReturnTrue() {
        //Arrange
        
        //ACT
        let isFirstNameValid = sut.isFirstNamevalid(firstName: "Jordy")
        //Asser
        XCTAssertTrue(isFirstNameValid, "If isFirstNameValid() returns true its correct, if it returns falls the user has nothing inserted or the text inserted it too long" )
    }
    func testSignupFormMode_WhenValidFirstNameProvidedIsTooShort_ShouldReturnFalse() {
        // ACT
        let isFirstNameValid = sut.isFirstNamevalid(firstName: "J")
        // Assert
        XCTAssertFalse(isFirstNameValid, "isFirstNameValid should return False if the last name is shorter than \(SignupConstants.firstNameMinLength)")
    }
    
    func testSignupFormMode_WhenValidFirstNameProvidedIsTooLong_ShouldReturnFalse() {
        // ACT
        let isFirstNameValid = sut.isFirstNamevalid(firstName: "JordyVazquezJordyVazquez")
        // Assert
        XCTAssertFalse(isFirstNameValid, "isFirstNameValid should return False if the last name is Longer than \(SignupConstants.firstNameMaxLength)")
        
    }
 
    func testSignupFormModel_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        // ACT
        let lastNameIsValid = sut.isLastNameValid(lastName: "Vazquez")
        
        XCTAssertTrue(lastNameIsValid, "If isFirstNameValid() returns TRUE it is okay, Else if it returns FALSE, the it is emptey or too long")
    }
    func testSignupFormModel_WhenValidLastNameProvidedIsTooShort_ShouldReturnFalse() {
        //ACT
        let islastNameIsValid = sut.isLastNameValid(lastName: "Vaz")
        
        // Assert
        XCTAssertFalse(islastNameIsValid, "isFirstNameValid should return False if the last name is shorter than \(SignupConstants.lastNameMinLength)" )
    }
    
    func testSignupFormModel_WhenValidLastNameProvidedIsTooLong_ShouldReturnFalse() {
        // ACT
        let isLastNameValid = sut.isLastNameValid(lastName: "VazquezJordyVazquezJordyVazquez")
        
        //Assert
        XCTAssertFalse(isLastNameValid, "isFirstNameValid should return False if the last name is shorter than \(SignupConstants.lastNameMaxLength)")
        
    }
    
    func testingSingupFormMode_WhenEmailProvidedWithCorrectCredentials_ShouldRerturnTrue() {
        // ACT
        let isEmailValid = sut.isEmailValid(email: "jordy@test.com")
        
        //Assert
        XCTAssertTrue(isEmailValid, "The email provided should return true if has the correct credintials, if it returns false there is something worng with he email provided")
    }

}