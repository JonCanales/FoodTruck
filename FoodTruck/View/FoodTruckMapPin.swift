//
//  FoodTruckMapPin.swift
//  FoodTruck
//
//  Created by Jada White on 6/19/21.
//
// On my honor, I have neither received nor given any unauthorized assistance on this assignment.” -- Jada White

import SwiftUI

struct FoodTruckMapPin: View {
    // MARK: - Properties
    
    // Triangle shape
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            
            return path
        }
    }
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Pin background
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
                .cornerRadius(8)
            
            // Pin tail
            Triangle()
                .fill(Color.accentColor)
                .frame(width: 36, height: 36, alignment: .center)
                .rotationEffect(Angle(degrees: 180), anchor: .center)
                .offset(x: 0, y: 25.0)
            
            // Default pin image
            Image("truck")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Rectangle())
        }
    }
}

// MARK: - Preview

struct FoodTruckMapPin_Previews: PreviewProvider {
    static var previews: some View {
        FoodTruckMapPin()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
