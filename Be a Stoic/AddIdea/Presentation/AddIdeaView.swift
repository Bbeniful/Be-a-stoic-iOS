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
    @State var ideaText: String = ""
    @State var isChecked: Bool = false
    
    private var ideaObj: Idea?
    
    init(isChecked: Bool = true, ideaObj: Idea? = nil) {
        self.isChecked = isChecked
        self.ideaObj = ideaObj
        
    }
    
    private func setExisitingIdea(){
        guard let idea = ideaObj else { return }
        ideaText = idea.text
    }
    
    var body: some View {
        BaseBackground(title:"Add", isSettingsVisible: false, shouldNavigateBack: true,
                       content: VStack{
            
            
            TextField("", text: $ideaText, prompt: Text("Your thought..."))
            Toggle("is draft", isOn: $isChecked)
            Spacer()
            BaseButton(buttonAction: {
                viewModel.addIdea(idea: ideaText, isDraft: isChecked, context: managedObjectContext)
                coordinator.popBack()
            }, text: "Save")
            
        }.padding()
        ).onAppear{
            setExisitingIdea()
        }
    }
}

#Preview {
    AddIdea()
}
