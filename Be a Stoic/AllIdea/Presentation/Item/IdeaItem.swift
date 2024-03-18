//
//  IdeaItem.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 16/03/2024.
//

import SwiftUI

struct IdeaItem: View {
    
    var ideaItem: Idea
    let coordinator: Coordinator?
    
    init(ideaItem: Idea, coordinator: Coordinator? = nil) {
        self.ideaItem = ideaItem
        self.coordinator = coordinator
    }
    
    var body : some View {
        VStack{
            HStack(alignment: .top){
                Text(ideaItem.text)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding()
                if ideaItem.isDraft {
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                        .frame(
                            width: 50,
                            height: 50,
                            alignment: .leading)
                }
                
            }
            .onTapGesture {
                if ideaItem.isDraft {
                    coordinator?.push(page: .add(idea: ideaItem))
                }
            }
            .background(Color.gray)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .background(Color.green)
        )
        .cornerRadius(25)
        .padding()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    let idea = Idea(text: "Helloka", isDraft: true)
    return IdeaItem(ideaItem: idea)
}
