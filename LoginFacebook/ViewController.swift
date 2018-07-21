//
//  ViewController.swift
//  LoginFacebook
//
//  Created by asad on 19/07/18.
//  Copyright © 2018 imastudio. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import FBSDKLoginKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var loginButton = LoginButton(readPermissions: [ .publicProfile ])
        var loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)
        
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            
            print("User sudah masuk dengan token \(accessToken)")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

