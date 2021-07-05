//
//  VendorMenuViewController.swift
//  FoodTruck
//
//  Created by Jada White on 7/2/21.
//

import UIKit

class VendorMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitEventsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.eventSegue, sender: sender)
    }
    
    @IBAction func paymentButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func contactButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.contactSegue, sender: sender)
    }
    
}
