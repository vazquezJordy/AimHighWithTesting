//
//  SigninValidationService.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 4/7/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import Foundation

struct SignInValidationService {
    
    func validateEmail(email: String?) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
    
    func validatePassword(password: String?)throws -> String {
        guard let password = password else {throw ValidationError.invalidValue}
        guard password.count >= SignupConstants.passwordMinLength else {throw ValidationError.passwordTooShort}
        guard password.count <= SignupConstants.passwordMaxLength else {throw ValidationError.passwordTooLong}
        return password
    }
}


