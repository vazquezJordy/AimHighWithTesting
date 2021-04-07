//
//  SignupFormModelValidator.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 3/30/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import Foundation

class SingupFormModelValidator {
    
    func isFirstNamevalid(firstName: String) -> Bool {
        var returnedValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnedValue = false
            
        }
        return returnedValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnedValue = true
        if lastName.count < SignupConstants.lastNameMinLength || lastName.count > SignupConstants.lastNameMaxLength {
            returnedValue = false
        }
        return returnedValue
    }
    
    func isEmailValid(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
        
    }
    func isPasswordValid(password: String) -> Bool {
        var returnedValue = true
        
        if password.count < SignupConstants.passwordMinLength || password.count > SignupConstants.passwordMaxLength{
            returnedValue = false
        }
        return returnedValue
    }
}


