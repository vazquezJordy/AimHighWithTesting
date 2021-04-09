//
//  LoginViewController.swift
//  AimHigh
//
//  Created by Jordy Vazquez on 7/27/20.
//  Copyright © 2020 Jordy Vazquez. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFiel: UITextField!
    @IBOutlet weak var passwordTextFiel: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    private let signInValidation: SignInValidationService
    
    init(signInValidation: SignInValidationService) {
        self.signInValidation = signInValidation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.signInValidation = SignInValidationService()
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextFiel.text = "jvaazque@noman.com"
        passwordTextFiel.text = "abcd@1234"
       setUpElements()
    }
    
   
    func setUpElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextFiel)
        Utilities.styleTextField(passwordTextFiel)
         Utilities.styleFilledButton(loginButton)
    }
    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTextFiel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = try! signInValidation.validatePassword(password: passwordTextFiel.text!) 
        print(email)
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            } else {
                print(email)
                AppDelegate.userID = result?.user.uid ?? ""
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as! OpeningGoalsPageTableViewController
                let navControllor = UINavigationController(rootViewController: homeViewController)
                self.view.window?.rootViewController = navControllor
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    }


extension UIViewController {
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
                return "The user name you have entered is too SHORT"
            case .firstNameTooShort:
               return "The user name you have entered is too LONG"
            case .emailInvalid:
                return "Invalid email"
            case .lastNameTooLong:
                return "Last name is too LONG"
            case .lastNameTooShort:
                return "Last name is too SHORT"
            }
        }
    }

}
