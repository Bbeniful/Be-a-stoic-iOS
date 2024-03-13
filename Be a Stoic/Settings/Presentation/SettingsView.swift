//
//  SettingsView.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 13/03/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State var text: String = "Username"
    
    var body: some View {
        BaseBackground(title: "Settings", isSettingsVisible: false, content: VStack{
            TextField("Username",text: $text)
        }.padding()
        
        )
    }
}

#Preview {
    SettingsView(text: "almafa")
}
