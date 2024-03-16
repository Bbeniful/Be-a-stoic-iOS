//
//  BaseButton.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 11/03/2024.
//

import SwiftUI

struct BaseButton: View {
    
    let buttonAction: () -> Void
    let text: String
    
    var body: some View {
        Button(action: buttonAction) {
            Text(text)
                .foregroundColor(.white)
        }
        .foregroundColor(.white) // This line is redundant and can be removed
        .padding() // Add padding to ensure there's enough space for the text
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 2)
                .background(Color.gray)
        )
        .cornerRadius(25)
    }
}

#Preview {
    BaseButton(buttonAction: {}, text: "savjvhjhvjhvjhvjhvjhe")
}
