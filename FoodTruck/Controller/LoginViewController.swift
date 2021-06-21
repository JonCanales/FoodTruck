//
//  LoginViewController.swift
//  FoodTruck
//
//  Created by Sheick on 6/15/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.emailTextField.keyboardType = .emailAddress
        self.passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return(true)
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        
        //Optional Binding
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error{
                    
                    print(e.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                }
                
            }
        }
            //AUTOMATIC REFERENCE COUNTING -> keeps a tab of references, objects you create_-> optimizing memory management
            //Deinitializes ununsed objects, methods, values.
            // so if you use a "strong" connection it cannot be deintialized , but weak can
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
