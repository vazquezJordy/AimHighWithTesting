//
//  SignupFormModelValidator.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 3/30/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import Foundation

struct SingupFormValidator {
    
    func isFirstNamevalid(firstName: String?) throws -> String {
        guard let firstName = firstName else { throw ValidationError.invalidValue }
        guard firstName.count >= SignupConstants.firstNameMinLength else {throw ValidationError.firstNameTooShort}
        guard firstName.count <= SignupConstants.firstNameMaxLength else {throw ValidationError.firstNameTooLong}
        return firstName
    }
    
    func isLastNameValid(lastName: String?) throws -> String {
        guard let lastName = lastName else { throw ValidationError.invalidValue}
        guard lastName.count >= SignupConstants.lastNameMinLength else {throw ValidationError.lastNameTooShort}
        guard lastName.count <= SignupConstants.lastNameMaxLength else {throw ValidationError.lastNameTooLong}
        return lastName
    }
    
    func isEmailValid(email: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func isPasswordValid(password: String?)throws -> String {
        guard let password = password else {throw ValidationError.invalidValue}
        guard password.count >= SignupConstants.passwordMinLength else {throw ValidationError.passwordTooShort}
        guard password.count <= SignupConstants.passwordMaxLength else {throw ValidationError.passwordTooShort}
        return password
    }
}

