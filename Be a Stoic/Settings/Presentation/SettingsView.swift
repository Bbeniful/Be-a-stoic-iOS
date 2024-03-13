//
//  SettingsView.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 13/03/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    @State var viewModel = SettingsViewModel()
    
    @State var text: String = "Username"
    
    var body: some View {
        BaseBackground(title: "Settings", isSettingsVisible: false, shouldNavigateBack: true, content: VStack{
            TextField("Username",text: $text)
            Spacer()
            Button(action: {
                viewModel.save(userName: text)
                coordinator.popBack()
            }, label: {
                Text("Save")
            })
        }
            .navigationBarBackButtonHidden(true)
            .padding()
        
        )
    }
}

#Preview {
    SettingsView(text: "almafa")
}
