//
//  SingupFormModel.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 4/5/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import Foundation

struct SignupFormModel: Decodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}

// Dependency Injection (DI)
struct SignupViewModel {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
    init(signupFormModel: SignupFormModel) {
        self.firstName = signupFormModel.firstName
        self.lastName = signupFormModel.lastName
        self.email = signupFormModel.email
        self.password = signupFormModel.password
    }
}


enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case firstNameTooLong
    case firstNameTooShort
    case lastNameTooLong
    case lastNameTooShort
    case emailInvalid
    
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
        return "You have entered an invalid value"
        case .passwordTooLong:
        return "The password you have entered is too SHORT"
        case .passwordTooShort:
          return "The password you have entered is too LONG"
        case .firstNameTooLong:
            return "The user name you have entered is too LONG"
        case .firstNameTooShort:
           return "The user name you have entered is too SHORT"
        case .emailInvalid:
            return "Invalid email"
        case .lastNameTooLong:
            return "Last name is too LONG"
        case .lastNameTooShort:
            return "Last name is too SHORT"
        }
    }
}
