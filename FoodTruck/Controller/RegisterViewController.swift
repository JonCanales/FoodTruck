//
//  RegisterViewController.swift
//  FoodTruck
//
//  Created by Sheick on 6/15/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
            super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.emailTextField.keyboardType = .emailAddress
        self.passwordTextField.delegate = self
        

            // Do any additional setup after loading the view.
        }
    
    
    @IBOutlet weak var textfieldBox: UIStackView!
    
    
    //hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return(true)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        //Optional Binding -> if LET
        //only of both fields have a value, perform the authentication
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
            
                if let e = error{
                    
                    //localizedDescription to handle errors different lanaguages
                    print(e.localizedDescription)
                }
                
                else{
                    //whenever you call a function, it needs to use self keyboard while in a Closure
                    self.performSegue(withIdentifier: "registerSegue" , sender: self)
                }
            }
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
