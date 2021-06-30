//
//  ButtonView.swift
//  FoodTruck
//
//  Created by Jada White on 6/29/21.
//

import SwiftUI

struct ButtonView: View {
    // MARK: - Properties
    var text: String

    // MARK: - Body

    var body: some View {
        Button(action: {
            
        }) {
            Text(text)
        }
    }
}

// MARK: - Preview

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Start")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
