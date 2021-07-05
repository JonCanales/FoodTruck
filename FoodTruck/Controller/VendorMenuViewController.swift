//
//  VendorMenuViewController.swift
//  FoodTruck
//
//  Created by Jada White on 7/2/21.
//

import UIKit
import Stripe
import Alamofire

class VendorMenuViewController: UIViewController, STPAddCardViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // For Stripe payment system
    
    @objc func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        //Hello
    }
    
    @objc func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
        print("Done.")
    }

    @IBAction func paymentButtonPressed(_ sender: UIButton) {
        let config = STPPaymentConfiguration()
        config.requiredBillingAddressFields = .full
        let stripeViewController = STPAddCardViewController(configuration: config, theme: STPTheme.defaultTheme)
        stripeViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: stripeViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    
    fileprivate func createPayment(token: String, amount: Float) {
        AF.request("https://api.stripe.com/v1/charges", method: .post, parameters: ["pk_live_51J4U8DJ951GjkWs403P5DZF4a3sCOlCZk74iVxTq0QqE3FQwLwEoOzbFjGSY4Qdv87opBUKFSPKk4fDF3JY3A3G300mGSs71NQ": token, "0.01": amount * 100],encoding: JSONEncoding.default, headers: nil).responseString { response in
                switch response.result {
                case .success:
                    print("Success")
                    break
                case .failure(let error):
                    print("Failure")
                }
            
        }
        
    }
}
