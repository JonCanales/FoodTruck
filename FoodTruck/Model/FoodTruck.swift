//
//  FoodTruckLocation.swift
//  FoodTruck
//
//  Created by Jada White on 7/5/21.
//
// "On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import Foundation
import MapKit

class FoodTruckLocation: NSObject, MKAnnotation, Codable {
    var title: String?
    var coordinate: CLLocationCoordinate2D

    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "Vendor_name"
        case latitude = "lat"
        case longitude = "lon"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        coordinate = CLLocationCoordinate2D(latitude: try values.decode(Double.self, forKey: .latitude), longitude: try values.decode(Double.self, forKey: .longitude))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(title, forKey: .title)
    }
}
