//
//  SecondViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import GoogleSignIn

class SecondViewController: UIViewController,GIDSignInUIDelegate {

//    var userName = String()
//    var mailId = String()
    
    
   
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var imageViewLabel: UIImageView!
    
    @IBOutlet weak var mailIdLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self as GIDSignInUIDelegate
        guard let userName = UserDefaults.standard.object(forKey: "Name") as? String, let mailId = UserDefaults.standard.object(forKey: "Email") as? String else {
            return
        }
        
        userNameLabel.text = userName
        mailIdLabel.text = mailId
        
        
                // Start background thread so that image loading does not make app unresponsive
        
        if let imageURL = UserDefaults.standard.url(forKey: "imageURL") {
            print(imageURL)
            
            DispatchQueue.global(qos: .userInitiated).async {
                
                let imageData:NSData = NSData(contentsOf: imageURL)!
                let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
                imageView.center = self.view.center
                
                // When from background thread, UI needs to be updated on main_queue
                DispatchQueue.main.async {
                    let image = UIImage(data: imageData as Data)
                    imageView.image = image
                    imageView.contentMode = UIViewContentMode.scaleAspectFit
                    self.view.addSubview(imageView)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    
}
