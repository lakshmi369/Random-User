//
//  ThirdViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import GoogleSignIn

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func goToLogin(_ sender: Any) {
        
        
       
        guard let navigateToLogin = self.storyboard?.instantiateViewController(withIdentifier: "FirstView") as? FirstViewController else {
            return
        }
        self.navigationController?.pushViewController(navigateToLogin, animated: true)
         GIDSignIn.sharedInstance().signOut()
        

    }




}
