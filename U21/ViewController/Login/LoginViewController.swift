//
//  LoginViewController.swift
//  U21
//
//  Created by Kong on 3/31/2561 BE.
//  Copyright © 2561 u21. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                guard let userRaw = user else { return }
                let userRef = Database.database().reference(withPath: "Users")
                let user = UserModel(uid: userRaw.uid, name: userRaw.displayName!, avatar: "\(userRaw.photoURL!)", email: userRaw.email!, score: 0)
                //let userValue = ["uid": userRaw.uid, "name": userRaw.displayName!, "avatar": userRaw.photoURL!, "email": userRaw.email!] as [String : Any]
                userRef.child(user.uid).setValue(["uid": userRaw.uid, "name": userRaw.displayName!, "avatar": "\(userRaw.photoURL!)", "email": userRaw.email!, "score": 0])
                
                
                let mapVC = MapViewController()
                self.show(mapVC, sender: self)
                print("Success")

                
            })
            
        }
    }
}
