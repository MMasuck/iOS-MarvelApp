//
//  LoginViewController.swift
//  MarvelApp
//
//  Created by Mariel Masuck on 27/09/2022.
//  Copyright © 2022 Mmasuck. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            } else {
                //Navigate to HomeViewController
                self.performSegue(withIdentifier: "LoginToHome", sender: self)
                }
            }
        }
    }

}
