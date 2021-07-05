//
//  LoginViewController.swift
//  FoodTruck
//
//  Created by Sheick on 6/15/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        
        //Optional Binding
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if let e = error{
                    
                    print(e.localizedDescription)
                }
                else{
                    self.performSegue(withIdentifier: Segues.paymentSegue, sender: self)
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
