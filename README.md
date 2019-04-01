# CSC371FinalProject

WeChat Clone Documentation

	WeClat Clone is a fully functional group chat application. Anyone with the application can sign up and communicate with anyone in the world in real time. In WeChat you are able to register for a new account. If you enter a valid email address, it is added to a real time database on Firebase. With your information stored in the cloud you can log out and come back whenever you want.  Once you are a signed in member you can join the conversation and talk in a group chat with other users. 

Features

-	Authentication management of new and existing users.
-	Login/Register Screens.
-	Loading animated when a user resisters or logs into the app.
-	Realtime Database to store messages and users.
-	Single group chat message board that displays other users’ emails and messages they have sent.
-	Animated text bubbles with a generic avatar photo are present.

Application 


 
 


Welcome Board

 



-	The login board is the first thing a user sees when they open the application. 
-	The whole application is managed using a Navigation Controller. 
-	This welcome board is the first view controller. 
-	The background is an image asset put on an Image View. 
-	Both the buttons on the view controller have a custom-built image attached to them.
-	The login button segues to the Login View Controller. The register button segues to the register view controller.
Login Board

 


-	Login view controller is shown to the user once they press the login button in the welcome controller.
-	The background is another image asset on an Image View.
-	Both of the input bars are Text Labels that pass their information to Firebase for verification.
-	The Login Button is a custom-built image that when pressed segues to the Chat scene.
-	The back button in the top left corner of the app segues back to the Welcome board.
Register Board

 


-	Register view controller is shown to the user once they press the register button I the welcome controller.
-	The background is another image asset on an Image View.
-	Both of the input bars are Text Labels that pass their information to Firebase for verification.
-	The Register Button is a custom-built image that when pressed segues to the Chat scene.
-	The back button in the top left corner of the app segues back to the Welcome board.
Chat Board

 

-	Once a user has successfully logged into the application, they are automatically segued to the chat controller.
-	The Chat View Controller contains a table view that displays the messages. 
-	Each message is a custom-built dynamic prototype cell that displays the user that sent the message, as well as the message body.
-	The send button is a custom-built image that when pressed sends the “sender” & “message” to Firebase.
-	The message bar is a Text Label that sends its contents to Firebase
-	The Back Button in the top left corner segues the view back to either the Login or Register board.
-	The Log Out button in the top right segues the view back to the welcome board.
Other Related Documentations

CocoaPods where used in the making of this project. Firebase needs several pod files to use their service with authentication and database management. Chameleon Framework pod files where used to add better colors to the message board. SVProgressHUD is from CocoaPods and has a dependency manager for Objective-C.

CocoaPods
		CocoaPods manages library dependencies for your Xcode projects.

The dependencies for your projects are specified in a single text file called a	 Podfile. CocoaPods will resolve dependencies between libraries, fetch the resulting source code, then link it together in a Xcode workspace to build your project

Ultimately the goal is to improve discoverability of, and engagement in, third party open-source libraries by creating a more centralized ecosystem.

For additional information of CocoaPods visit: https://cocoapods.org/ 

Firebase
Firebase is a Google owned service that helps developers to build applications quickly without managing the infrastructure. Firebase has various functionality including analytics, databases, messaging and crash reporting. These are the methods that were used in this project:




















Login and Registration methods
 

 
Database methods
 

 

Firebase is an extremely complex and well documented platform. If you would like additional information visit: https://firebase.google.com/docs/reference/swift/firebasecore/api/reference/Classes?authuser=0 












SVProgessHUD

SVProgessHUD is a clean and easy-to-use HUD meant to display the progress of an ongoing task on iOS and tvOS. 

 


They have created a github page explaining their open-source product, visit: https://github.com/SVProgressHUD/SVProgressHUD

