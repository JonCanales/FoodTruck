//
//  FoodTruckMapView.swift
//  FoodTruck
//
//  Created by Jada White on 6/19/21.
//
// On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import SwiftUI
import MapKit
import FirebaseFirestore

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
    
    let db = Firestore.firestore()
    
//    var locations: [FoodTruckLocation] = []
    
    // MARK: - Initializer
    init() {
//        fetchLocations()
//        
//        func fetchLocations() {
//            db.collection("locations").addSnapshotListener {
//                (docSnap, error) in
//                
//                self.locations = []
//                
//                if let err = error {
//                    print("Error when retrieving locations: \(err.localizedDescription)")
//                }
//                else {
//                    if let snaps = docSnap?.documents {
//                        for doc in snaps {
//                            print(doc.data())
//                            
//                            let data = doc.data()
//                            
//                            if let docId = doc.documentID as? String, let lat = data["lat"] as? Double, let long = data["lon"] as? Double {
//                                let location = FoodTruckLocation(id: docId, latitude: lat, longitude: long)
//                                
//                                self.locations.append(location)
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    // MARK: - Body
    
    var body: some View {
        Text("Hello")
        // Map
//        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
//            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
//                FoodTruckMapPin(location: item)
//            }
//        })
    }
    
    // MARK: - Preview
    
    struct FoodTruckView_Previews: PreviewProvider {
        static var previews: some View {
            FoodTruckMapView()
        }
    }
}
