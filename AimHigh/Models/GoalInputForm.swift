//
//  GoalInputForm.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 4/20/21.
//  Copyright © 2021 Jordy Vazquez. All rights reserved.
//

import Foundation

struct GoalInputForm {
    func isNameOfGoalValid(nameOfGoal: String?) throws -> String? {
        guard let nameOfGoal = nameOfGoal else { throw GoalInputError.invalidValue}
        guard nameOfGoal.count >= GoalFormConstants.nameOfGoalMinLength else {
            throw
            GoalInputError.nameOfGoalTooShort
        }
        return nameOfGoal
    }
}
