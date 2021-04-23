//
//  GoalInputForm.swift
//  AimHighTests
//
//  Created by Jordy Vazquez on 4/22/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import XCTest
@testable import AimHigh

class GoalInputForm: XCTestCase {
    
    var sut: GoalInputForm!

    override func setUpWithError() throws {
        sut = GoalInputForm()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Is_NameOfGoalValid() {
        XCTAssertNoThrow(isNameOfGoalValid(nameOfGoal: "My goal is to get better on coding"))
    }
    
    func test_is_NameOfGoal_Nil() {
        let expectedError = GoalInputError.invalidValue
        var error: GoalInputError?
        
        sut = GoalInputForm.isNameOfGoalValid(nameOfGoal: nil)
        
        XCTAssertThrowsError(<#T##expression: T##T#>)
    }

}
