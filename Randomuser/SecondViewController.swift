//
//  SecondViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var userName = String()
    var mailId = String()
    
    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var emailIdLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        
        
        let name = UserDefaults.standard.object(forKey: "Name")
        let email = UserDefaults.standard.object(forKey: "EmailId")
       
        userName = "User name is: \(name ?? "")"
        mailId = "User Mail Id is: \(email ?? "")"
        
        userNameLabel.text = userName
        emailIdLabel.text = mailId
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
}
