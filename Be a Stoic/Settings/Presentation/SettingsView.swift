//
//  SettingsView.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 13/03/2024.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    
    
    @EnvironmentObject var coordinator: Coordinator
    @Environment(\.managedObjectContext) var managedObjectContext

    
    @State var viewModel = SettingsViewModel()
    
    @State var text: String = ""
    
    var body: some View {
        BaseBackground(title: "Settings", isSettingsVisible: false, shouldNavigateBack: true, content: VStack{
            TextField("",text: $text, prompt: Text("Username"))
            Spacer()
            BaseButton(buttonAction: {
                viewModel.save(userName: text, context: managedObjectContext)
                coordinator.popBack()
                print(text)
            }, text: "save")
        }
            .navigationBarBackButtonHidden(true)
            .padding()
                       
        ).onAppear{
            viewModel.getUserSettings(context: managedObjectContext)
            if let name = viewModel.userName {
                self.text = name
                print(name)
            }
            
        }
        
    }
}

#Preview {
    SettingsView(text: "")
}
