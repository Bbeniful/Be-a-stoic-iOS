//
//  AddIdea.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

struct AddIdea: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var coordinator: Coordinator

    @State var viewModel = AddIdeaViewModel()
    @State var idea: String = ""
    @State var isChecked: Bool = false
    
    var body: some View {
        BaseBackground(title:"Add", isSettingsVisible: false, shouldNavigateBack: true,
                       content: VStack{
            TextField("", text: $idea, prompt: Text("Your thought..."))
            Toggle("is draft", isOn: $isChecked)
            Spacer()
            BaseButton(buttonAction: {
                viewModel.addIdea(idea: idea, isDraft: isChecked, context: managedObjectContext)
                coordinator.popBack()
            }, text: "Save")
            
        }.padding()
        )
    }
}

#Preview {
    AddIdea()
}
