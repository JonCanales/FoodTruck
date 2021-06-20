//
//  FoodTruckMapView.swift
//  FoodTruck
//
//  Created by Jada White on 6/19/21.
//
// On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import SwiftUI
import MapKit

struct FoodTruckMapView: View {
    // MARK: - Properties
    
    @State private var region: MKCoordinateRegion = {
        
        // Starting coordinates
        var mapCoordinates = CLLocationCoordinate2D(latitude: 40.4862158, longitude: -74.4518188)
        
        // Default map zoom level
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 2.5, longitudeDelta: 2.5)
        
        // Map region
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    // MARK: - Body
    
    var body: some View {
        // Map
        Map(coordinateRegion: $region)
    }
    
    // MARK: - Preview
    
    struct FoodTruckView_Previews: PreviewProvider {
        static var previews: some View {
            FoodTruckMapView()
        }
    }
}
