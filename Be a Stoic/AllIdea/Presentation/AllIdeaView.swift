//
//  AllIdeaView.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

struct AllIdeaView: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @State var viewModel = AllIdeaViewModel()
    
    var body: some View {
        BaseBackground(title: "all thoghts",isSettingsVisible: true,shouldNavigateBack: false, content: VStack{
            ForEach((1...10), id: \.self){ idea in
                IdeaItem(ideaItem: Idea(text: "Hi, \(idea)"))
                
            }
            Spacer()
            HStack(){
                BaseButton(buttonAction: {
                    coordinator.push(page: .add)
                }, text: "add")
                
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding()
            
        })
        
    }
}


private struct IdeaItem: View {
    var ideaItem: Idea
    
    var body : some View {
        Text(ideaItem.text)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 10)
    }
}



#Preview {
    AllIdeaView()
}
