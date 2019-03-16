//
//  LogInBoardViewController.swift
//  CSC371FinalProject
//
//  Created by Nathaniel Alvarado on 3/7/19.
//  Copyright © 2019 Nathaniel Alvarado. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInBoardViewController: UIViewController {

    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        // Show loading screen
        SVProgressHUD.show()
        
        // Log user in
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            // If an error has occured on login
            // Add alert box pop up after
            if error != nil {
                print(error!)
            } else {
                // Created the users account
                // Make alert pop-up for this
                print("Login Successful")
                // Dismiss loading screen
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "segueToMessageBoard", sender: self)
            }
        }
        
        // Look up how to log users in using Google
        
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
