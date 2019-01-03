//
//  AdminCreateUserViewController.swift
//  PNRustfriApp
//
//  Created by Casper on 19/12/2018.
//  Copyright © 2018 Casper. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Alamofire

class AdminCreateUserViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var usernameTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OpretBrugerButton(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: self.emailTextfield.text!, password: self.passwordTextfield.text!) {(user, error) in
            if user != nil {
                print("User Has SignUp")
            }
            if error != nil {
                print("Signup failed")
            }        }
        let url = "http://hoursregisteringrestservice.azurewebsites.net/Service1.svc/user"
        let param : Parameters = ["Email": emailTextfield.text!,
                                  "Username": usernameTextfield.text!,
                                  "status": "0"]
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default).responseString { response in
            print(response)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
