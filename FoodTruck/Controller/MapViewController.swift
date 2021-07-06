//
//  MapViewController.swift
//  FoodTruck
//
//  Created by Jada White on 7/5/21.
//
// "On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import UIKit
import MapKit
import FirebaseFirestore

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    let initializedLocation = CLLocation(latitude: 40.4862158, longitude: -74.4518188)
    
    let db = Firestore.firestore()
    
    var trucks: [FoodTruckLocation] = []
    
    var sampleTrucks: [FoodTruckLocation] = [
        FoodTruckLocation(title: "ABC Truck", coordinate: CLLocationCoordinate2D(latitude: 40.4862158, longitude: -74.4518188)),
        FoodTruckLocation(title: "DEF Truck", coordinate: CLLocationCoordinate2D(latitude: 40.914745, longitude: -74.162827)),
        FoodTruckLocation(title: "Fried Onions", coordinate: CLLocationCoordinate2D(latitude: 40.742819, longitude: -74.177071))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.centerView(initializedLocation)
        
        fetchLocations()
        
        if !trucks.isEmpty {
            for truck in trucks {
                mapView.addAnnotation(truck)
            }
        }
        else {
            for truck in sampleTrucks {
                mapView.addAnnotation(truck)
            }
        }

    }
    
    func fetchLocations() {
        db.collection("locations").addSnapshotListener {
            (docSnap, error) in

            self.trucks = []

            if let err = error {
                print("Error when retrieving locations: \(err.localizedDescription)")
            }
            else {
                if let snaps = docSnap?.documents {
                    for doc in snaps {
                        print(doc.data())

                        let data = doc.data()

                        if let name = data["Vendor_name"] as? String, let lat = data["lat"] as? Double, let long = data["lon"] as? Double {
                            let truck = FoodTruckLocation(title: name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                            
                            self.trucks.append(truck)
                        }
                    }
                }
            }
        }
    }

}

private extension MKMapView {
    func centerView(_ location: CLLocation, regionRadius: CLLocationDistance = 200000) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        setRegion(region, animated: true)
    }
}
