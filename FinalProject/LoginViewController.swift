//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Sarah Radzihovsky on 5/31/16.
//  Copyright © 2016 Sarah Radzihovsky. All rights reserved.
//

//used ideas from both https://www.youtube.com/watch?v=cpANieebE2M and http://studyswift.blogspot.com/2016/01/facebook-sdk-and-swift-create-facebook.html but both were modified
//frameworks and additional instructions from https://developers.facebook.com/docs/facebook-login/ios

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.delegate = self
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Facebook API
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("succesfully logged in")
        self.performSegueWithIdentifier("enterApp", sender: self)
    }
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        //empty
    }
}
