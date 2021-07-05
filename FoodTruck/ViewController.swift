//
//  ViewController.swift
//  FoodTruck
//
//  Created by Jonathan Canales on 6/13/21.
//

import UIKit
import Stripe
import Alamofire
import CoreLocation
import Firebase

class ViewController: UIViewController, STPAddCardViewControllerDelegate,CLLocationManagerDelegate {
    var db: Firestore!
    let path = Firestore.firestore().collection("vendorLocations").document("vendorLocations")
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var vendorName: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginemailTextField: UITextField!
    
    @IBOutlet var loginpasswordTextField: UITextField!
    
    var manager: CLLocationManager = CLLocationManager()
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        self.dismiss(animated: true)
        
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
        print("Done.")
        self.dismiss(animated: true)
        // performSegue(withIdentifier: "Create Account", sender: AnyObject.self) 
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
 
    @IBAction func StripePaymentVendor(_ sender: Any) {
        let config = STPPaymentConfiguration()
        config.requiredBillingAddressFields = .full
        let viewController = STPAddCardViewController(configuration: config, theme: STPTheme.defaultTheme)
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
        
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
              
            
                if let e = error{
                    
                    //localizedDescription to handle errors different lanaguages
                    print(e.localizedDescription)
                }
                
                else{
                    //whenever you call a function, it needs to use self keyboard while in a Closure
                    self.performSegue(withIdentifier: "loginSegue" , sender: self)
                }
            }
        }
    }
    
    fileprivate func createPayment(token: String, amount: Float) {

        AF.request("https://api.stripe.com/v1/charges", method: .post, parameters: ["pk_live_51J4U8DJ951GjkWs403P5DZF4a3sCOlCZk74iVxTq0QqE3FQwLwEoOzbFjGSY4Qdv87opBUKFSPKk4fDF3JY3A3G300mGSs71NQ": token, "0.01": amount * 100],encoding: JSONEncoding.default, headers: nil).responseString {
    response in
    switch response.result {
    case .success:
    print("Success")

    break
    case .failure(let error):

    print("Failure")
    }
    }
    }
    
    @IBAction func EnableLocation(_ sender: Any) {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else{
            return
        }
       print( "\(first.coordinate.longitude) | \(first.coordinate.latitude)")
        
        
        func saveText(theText: String) {
              let db = Firestore.firestore()
            let vendor_Name = vendorName.text
            let dict = ["Vendor_Name": vendor_Name,"lon":first.coordinate.longitude,"lat":first.coordinate.latitude] as [String : Any]
              db.collection("locations").addDocument(data: dict)
          }
        saveText(theText: "Hello")
    }
    
    
    @IBAction func login(_ sender: Any) {
        //Optional Binding
        if let email = loginemailTextField.text, let password = loginpasswordTextField.text{
            
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
    
    
    
    
    }
    
    

