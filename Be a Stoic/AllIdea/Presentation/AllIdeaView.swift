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
    @State var title: String = ""
    
    var body: some View {
        AllIdea(buttonAction: {
            coordinator.push(page: .add(idea: nil))
        }, ideas: ideas, coordinator: coordinator, title: title)
        .onAppear{
            viewModel.getAllIdea(context: managedObjectContext)
            if let ideasFromView = viewModel.ideas {
                ideas = ideasFromView
            }
            let name = viewModel.getUserName(context: managedObjectContext)
            if name!.isEmpty {
                title = "all thoughts"
            } else {
                title = name! + ", thoughts"
            }
        }
    }
}

struct AllIdea : View{
    let buttonAction: () -> ()
    let ideas: [Idea]
    let title: String
    let coordinator: Coordinator?
    
    @State var shouldShowDrafts = false
    
    init(buttonAction: @escaping () -> Void = {}, ideas: [Idea] = [], coordinator: Coordinator? = nil, title: String  = "") {
        self.buttonAction = buttonAction
        self.ideas = ideas
        self.coordinator = coordinator
        self.title = title
    }
    
    var body: some View{
        BaseBackground(title:title, isSettingsVisible: true, shouldNavigateBack: false, content: VStack{
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
