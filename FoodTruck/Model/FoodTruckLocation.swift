//
//  FoodTruckLocation.swift
//  FoodTruck
//
//  Created by Jada White on 7/5/21.
//

import Foundation

struct FoodTruckLocation: Codable, Identifiable {
    var id: String
    
    let latitude: Double
    let longitude: Double
}
