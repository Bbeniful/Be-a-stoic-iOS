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
    @State var ideas: [MyIdeaModel] = []
    
    var body: some View {
        BaseBackground(title: "all thoghts",isSettingsVisible: true,shouldNavigateBack: false, content: VStack{
            ForEach(ideas, id: \.id){ idea in
                IdeaItem(ideaItem: idea.toIdea())
                
            }
            Spacer()
            HStack(){
                BaseButton(buttonAction: {
                    coordinator.push(page: .add)
                }, text: "add")
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding()
            
        }).onAppear{
            viewModel.getAllIdea(context: managedObjectContext)
            if let ideasFromView = viewModel.ideas {
                ideas = ideasFromView
            }
        }
        
    }
}

#Preview {
    AllIdeaView()
}
