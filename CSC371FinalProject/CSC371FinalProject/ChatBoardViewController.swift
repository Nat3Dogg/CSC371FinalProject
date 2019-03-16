//
//  ChatBoardViewController.swift
//  CSC371FinalProject
//
//  Created by Nathaniel Alvarado on 3/7/19.
//  Copyright © 2019 Nathaniel Alvarado. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatBoardViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var messageBoxLayoutConstraint: NSLayoutConstraint!
    
    var messageArray: [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegate and datasource
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:
        messageTextfield.delegate = self
        
        
        //TODO: Set the tapGesture here:
        // Possiblily change to how we learned how to handle tap gestures in class
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        
        // Register MessageCell.xib file here, remember if you want to use a different file you need to register it
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // Automatically resize message cell if needed
        configureTableView()
        retrieveMessages()
        // Remove the lines on the table view
        messageTableView.separatorStyle = .none
    }
    
    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    // This gets called for every single table row, makes the cells populate with our custom made cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "Avatar")
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email {
            
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
        } else {
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        
        return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Give the number of objects in the message array
        // This allows for the endless growth of a message chain
        return messageArray.count
    }
    
    // Tap recognized
    //TODO: Declare tableViewTapped here:
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }
    
    //Declare configureTableView, this allows for a message cell to resize based on the length of the message
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    

    // Apperently the high of the keyboard is 308 
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
//        }
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    
    // When you press on the message text field the keyboard will come up and the view of the message "box" will disappear
    // this adjusts the message box's constraint and adds the hight of the keyboard + the hight of the message box
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 327, 357
        UIView.animate(withDuration: 0.5, animations: {
            self.messageBoxLayoutConstraint.constant = 377
            self.view.layoutIfNeeded()
            })
    }
    
    
    
    // Editing is done, change the text box size back to normal
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.messageBoxLayoutConstraint.constant = 69
            self.view.layoutIfNeeded()
        })
    }
    
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        // Delete this later
        messageTextfield.endEditing(true)
        //TODO: Send the message to Firebase and save it in our database
        // Disable the ability for someone to send messages (this allows for the possible issue of a long network wait time and multiple sends not stacking up
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        // Create a refence to a new database when the user hits send
        let messagesDatabase = Database.database().reference().child("Messages")
        
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "Message": messageTextfield.text!]
        
        // Save the message dictionary in the database
        messagesDatabase.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            // Add alert button if a failure occures
            if error != nil {
                print(error!)
            } else {
                print ("Message saved")
                
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
            }
        }
    }
    
    // Retrieve messages from the database:
    func retrieveMessages() {
        
        let messageDatabase = Database.database().reference().child("Messages")
        // Ask firebase to get a new message added to the database
        messageDatabase.observe(.childAdded) { (currentState) in
            
            let currentStateData = currentState.value as! Dictionary<String, String>
            
            // Get message and sender
            let text = currentStateData["Message"]!
            let sender = currentStateData["Sender"]!
            // Set Message data file values to message and sender
            let message = Message()
            message.messageBody = text
            message.sender = sender
            // Add messages to a message array
            self.messageArray.append(message)
            // Configure the table view to show new messages
            self.configureTableView()
            self.messageTableView.reloadData()
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        // Log out the user and send them back to WelcomeBoardViewController
        do {
            // Try to logout the user
            try Auth.auth().signOut()
            // Pop back to the Login/Register Screen
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error, signing out was not done")
        }
    }
}
