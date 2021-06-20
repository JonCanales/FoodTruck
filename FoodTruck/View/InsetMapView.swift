//
//  InsetMapView.swift
//  FoodTruck
//
//  Created by Jada White on 6/19/21.
//
// On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import SwiftUI
import MapKit

struct InsetMapView: View {
    // MARK: - Properties
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.833851, longitude: -74.871826), span: MKCoordinateSpan(latitudeDelta: 300.0, longitudeDelta: 300.0))
    
    // MARK: - Body
    
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 315)
    }
}

// MARK: - Preview

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
