//
//  GoalItems.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 6/12/20.
//  Copyright © 2020 Jordy Vazquez. All rights reserved.
//

import Foundation
import UIKit

struct GoalStructure {
    let nameOfGoal: String?
    let imageGoal: UIImage?
    let reasonsForGoal: [String]
//    let reason1Input: String?
//    let reason2Input: String?
//    let reason3Input: String?
    let date: Date?
    var documentID: String
}

struct GoalInputStructure {
    let nameOfGoal: String?
    let imageGoal: UIImage?
    let reasonsForGoal: [String]
//    let reason1Input: String?
//    let reason2Input: String?
//    let reason3Input: String?
    let date: Date?
    var documentID: String
    
    init(goalStructure: GoalStructure) {
        self.nameOfGoal = goalStructure.nameOfGoal
        self.imageGoal = goalStructure.imageGoal
        self.reasonsForGoal = goalStructure.reasonsForGoal
        self.date = goalStructure.date
        self.documentID = goalStructure.documentID
//        self.reason1Input = goalStructure.reason1Input
//        self.reason2Input = goalStructure.reason2Input
//        self.reason3Input = goalStructure.reason3Input
    }
}

struct SmallGoalStructure: Equatable {
    let smallNameOfGoal: String?
    let smallDate: Date?
    let goalNotes: String?
    var document: String
    
    static func == (lhs: SmallGoalStructure, rhs: SmallGoalStructure) -> Bool {
        return lhs.smallNameOfGoal == rhs.smallNameOfGoal && lhs.goalNotes == rhs.goalNotes
    }
}

struct Constants {
    struct Storyboard {
     static let homeViewController = "HomeVc"
    }
}

// This is so that i cange change the color of the placeHolder Text
extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

enum GoalInputError: LocalizedError {
    case invalidValue
    case nameOfGoalTooLong
    case nameOfGoalTooShort
    case reasonForGoal1TooShort
    case reasonForGoal1TooLong
    case reasonForGoal2TooShort
    case reasonForGoal2TooLong
    case reasonForGoal3TooShort
    case reasonForGoal3TooLong
    
    
    
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
        return "You have entered an invalid value"
        case .nameOfGoalTooShort:
        return "The name of the goal entered is too short"
        case .nameOfGoalTooLong:
            return "The name of the goal entered is too long"
        case .reasonForGoal1TooShort:
            return "The reasons for Goal 1 is too short"
        case .reasonForGoal1TooLong:
            return "The reason for Goal 1 is too Long"
        case .reasonForGoal2TooShort:
            return "The reasons for Goal 2 is too short"
        case .reasonForGoal2TooLong:
            return "The reason for Goal 2 is too Long"
        case .reasonForGoal3TooShort:
            return "The reasons for Goal 3 is too short"
        case .reasonForGoal3TooLong:
            return "The reason for Goal 3 is too Long"
        }
    }
}




