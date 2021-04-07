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
