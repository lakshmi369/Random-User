//
//  FirstViewController.swift
//  Randomuser
//
//  Created by user on 04/07/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    
    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var userIdField: UITextField!
    
    @IBOutlet var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gotoHomePage(_ sender: Any) {
        
        //For validating name TextField
        let name = nameField.text
        guard name != nil, name?.isEmpty == false else {
            let a = UIAlertController(title: "Warning", message: "Username Field Cannot be empty", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(a, animated: true, completion: nil)
            return
        }
        
        
        let validname =  validateName(Name: name)
        if validname {
            print("Name is valid")
        } else {
            print("Name is not valid")
            let invalidName = UIAlertController(title: "Warning", message: "Please enter valid name", preferredStyle:.alert)
            invalidName.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(invalidName, animated: true, completion: nil)
        }
        
        
        
        
        //For validating mailId Field
        let emailId = userIdField.text
        
        guard emailId != nil  && emailId?.isEmpty == false else {
            let emptyField = UIAlertController(title: "Alert", message: "EmailId Field cannot be empty", preferredStyle: .alert)
            emptyField.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(emptyField, animated: true, completion: nil)
            return
        }
        
        
        let validmail = validateEmail(candidate: emailId)
        if validmail {
            
        } else {
            let invalidId = UIAlertController(title: "Alert", message: "Please enter a valid EmailId", preferredStyle: .alert)
            invalidId.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(invalidId, animated: true, completion: nil)
        }
        
        
        //For validating Password Field
        let password = passwordField.text
        guard (password?.characters.count)! > 4 else {
            let invalidPass = UIAlertController(title: "Alert", message: "Min 5 characters required for password", preferredStyle: .alert)
            invalidPass.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(invalidPass, animated: true, completion: nil)
            return
        }
        
        
        
        
        if validname,validmail {
            let def = UserDefaults.standard
            def.set(name, forKey: "Name")
            def.set(emailId, forKey: "EmailId")
            let navigateToHome = self.storyboard?.instantiateViewController(withIdentifier: "TabView") as! TabViewController
            navigationItem.hidesBackButton = true
            
            //            let backbutton = UIBarButtonItem(title: "", style: .plain, target: SecondViewController.self, action: nil)
            //            navigationItem.leftBarButtonItem = backbutton
            
            self.navigationController?.pushViewController(navigateToHome, animated: true)
            
        }
    }
    
    //function to check for valid mail
    func validateEmail(candidate: String?) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    //function to check for valid name
    func validateName(Name: String?)-> Bool {
        
        let nameRegEx = "[A-Za-z]{2,200}"
        return NSPredicate(format: "SELF MATCHES %@", nameRegEx).evaluate(with: Name)
    }
   
        
        
    

}
