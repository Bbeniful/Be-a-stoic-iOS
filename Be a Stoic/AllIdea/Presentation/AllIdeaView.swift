//
//  AllIdeaView.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

struct AllIdeaView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject private var coordinator: Coordinator
    
    @State var viewModel = AllIdeaViewModel()
    @State var ideas: [Idea] = []
    
    var body: some View {
        AllIdea(buttonAction: {
            coordinator.push(page: .add(idea: nil))
        }, ideas: ideas, coordinator: coordinator)
        .onAppear{
            viewModel.getAllIdea(context: managedObjectContext)
            if let ideasFromView = viewModel.ideas {
                ideas = ideasFromView
            }
        }
    }
}

struct AllIdea : View{
    let buttonAction: () -> ()
    let ideas: [Idea]
    let coordinator: Coordinator?
    
    @State var shouldShowDrafts = false
    
    init(buttonAction: @escaping () -> Void = {}, ideas: [Idea] = [], coordinator: Coordinator? = nil) {
        self.buttonAction = buttonAction
        self.ideas = ideas
        self.coordinator = coordinator
    }
    
    var body: some View{
        BaseBackground(title: "all thoghts", isSettingsVisible: true, shouldNavigateBack: false, content: VStack{
            HStack{
                let draftText = shouldShowDrafts ? "hide drafts" : "show drafts"
                Text(draftText)
                    .foregroundColor(.white)
                    .onTapGesture {
                        shouldShowDrafts.toggle()
                    }
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding(.trailing,15)
            let data = shouldShowDrafts ? ideas : filterOnlyNotDraft(ideas: ideas)
            ForEach(data, id: \.id){ idea in
                IdeaItem(ideaItem: idea, coordinator: coordinator)
            }
            Spacer()
            HStack(){
                BaseButton(buttonAction: buttonAction, text: "add")
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding()
            
        })
    }
}


#Preview {
    AllIdea()
}
