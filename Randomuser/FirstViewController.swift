//
//  FirstViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google


class FirstViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{

    
    
    
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: false)
        super.viewDidLoad()
        var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
//        error == nil
        guard error == nil else {
            print(error ?? "Some Error")
            returnss
        }
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self as GIDSignInDelegate
        
        let signInButton = GIDSignInButton()
        signInButton.center = view.center
        //        signInButton.style = .standard
        view.addSubview(signInButton)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard error == nil else {
            print(error ?? "Some Error")
            return
        }
        
        
   
        guard let tabView = self.storyboard?.instantiateViewController(withIdentifier: "TabView") as? TabViewController else {
                return
        }
        self.navigationController?.pushViewController(tabView, animated: true)
        let userDetails =   UserDefaults.standard
        userDetails.set(user.profile.email, forKey: "Email")
        userDetails.set(user.profile.name, forKey: "Name")
        //get the image in string format
        if let imageURL = user.profile.imageURL(withDimension: 100) {
            userDetails.set(imageURL, forKey: "imageURL")
            print("UserDefault url :\(userDetails.set(imageURL, forKey: "imageURL"))")
        }
        

    }
    
    
}
