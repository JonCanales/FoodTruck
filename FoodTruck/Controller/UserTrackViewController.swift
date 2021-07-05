//
//  UserTrackViewController.swift
//  FoodTruck
//
//  Created by Jada White on 7/1/21.
//

import UIKit

class UserTrackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func vendorButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Segues.accountSegue, sender: sender)
    }
    
}
