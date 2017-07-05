//
//  ThirdViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

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
    

    
    @IBAction func goToLoginPage(_ sender: Any) {
        
        
        let navigateToLogin = self.storyboard?.instantiateViewController(withIdentifier: "FirstView") as! FirstViewController
        self.navigationController?.pushViewController(navigateToLogin, animated: true) 
        
        
        
    }
}
