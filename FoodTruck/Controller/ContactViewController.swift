//
//  ContactViewController.swift
//  FoodTruck
//
//  Created by Jada White on 6/29/21.
// "On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import UIKit

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func websiteButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://\(sender.currentTitle!)") {
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let phone = URL(string: "tel:+19083703130") {
            if UIApplication.shared.canOpenURL(phone) {
                UIApplication.shared.open(phone)
            }
        }
    }
    
    @IBAction func emailButtonPressed(_ sender: UIButton) {
        if let email = URL(string: "mailto:\(sender.currentTitle!)") {
            if UIApplication.shared.canOpenURL(email) {
                UIApplication.shared.open(email)
            }
        }
    }
}
