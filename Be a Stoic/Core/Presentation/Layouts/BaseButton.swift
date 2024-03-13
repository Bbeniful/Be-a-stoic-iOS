//
//  BaseButton.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 11/03/2024.
//

import SwiftUI

struct BaseButton: View {
    
    let buttonAction: () -> Void
    
    var body: some View {
        Button(action: buttonAction, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .foregroundColor(.white)
                .font(.system(size: 22))
        })
        .background(Color.blue)
    }
}

#Preview {
    BaseButton(buttonAction: {})
}
