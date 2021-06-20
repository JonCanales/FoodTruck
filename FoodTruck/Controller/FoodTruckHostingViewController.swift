//
//  FoodTruckHostingViewController.swift
//  FoodTruck
//
//  Created by Jada White on 6/19/21.
//
// On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import UIKit
import SwiftUI

class FoodTruckHostingViewController: UIHostingController<FoodTruckMapView> {
    
    // Initializer for hosting view controller
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: FoodTruckMapView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Preview
    
    struct FoodTruckHostingViewController_Previews: PreviewProvider {
        static var previews: some View {
            FoodTruckMapView()
        }
    }

}
