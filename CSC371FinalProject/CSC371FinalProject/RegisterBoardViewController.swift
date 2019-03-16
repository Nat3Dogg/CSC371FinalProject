//
//  RegisterBoardViewController.swift
//  CSC371FinalProject
//
//  Created by Nathaniel Alvarado on 3/6/19.
//  Copyright © 2019 Nathaniel Alvarado. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterBoardViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        // Show loading screen
        SVProgressHUD.show()
        
        // This will register new user in Firebase
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            // If an error has occured on regisration
            // Add alert box pop up after
            if error != nil {
                print(error!)
            } else {
                // Created the users account
                // Make alert pop-up for this
                print("Account Created Successfully")
                // Dismiss loading screen
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "segueToMessageBoard", sender: self)
            }
        }
        
        // Look up how to register users using Google Login
    }
    
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
