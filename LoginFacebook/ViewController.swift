//
//  ViewController.swift
//  LoginFacebook
//
//  Created by asad on 19/07/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import FacebookCore

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.delegate = self as? LoginButtonDelegate
        loginButton.center = self.view.center
        
        self.view.addSubview(loginButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            lblStatus.text = error.localizedDescription
            print(error.localizedDescription)
        }
        else if result.isCancelled{
            lblStatus.text = "User canceled log in"
            print("User canceled log in")
        }
        else {
            // successfully login
            lblStatus.text = "User logged in"
            print("User logged in")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        lblStatus.text = "User logged out"
        print("User logged out")
    }

}

