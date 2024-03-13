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
        ZStack(alignment: .center){
            Text(text)
                .padding() .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2))
        }
        .onTapGesture {
            buttonAction()
        }
        .background(Color.gray)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.white, lineWidth: 2))
        
    }
}

#Preview {
    BaseButton(buttonAction: {}, text: "save")
}
