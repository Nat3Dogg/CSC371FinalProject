//
//  ChatBoardViewController.swift
//  CSC371FinalProject
//
//  Created by Nathaniel Alvarado on 3/7/19.
//  Copyright © 2019 Nathaniel Alvarado. All rights reserved.
//

import UIKit

class ChatBoardViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Set yourself as the delegate and datasource here:
        
        
        
        //TODO: Set yourself as the delegate of the text field here:
        
        
        
        //TODO: Set the tapGesture here:
        
        
        
        //TODO: Register your MessageCell.xib file here:
    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    //TODO: Declare configureTableView here:
    
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    
    
    
    //TODO: Declare textFieldDidBeginEditing here:
    
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        //TODO: Send the message to Firebase and save it in our database
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
    }
    
    
}
