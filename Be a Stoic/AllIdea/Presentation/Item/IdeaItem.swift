//
//  IdeaItem.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 16/03/2024.
//

import SwiftUI

struct IdeaItem: View {
    
    var ideaItem: Idea
    
    var body : some View {
        VStack{
            HStack(alignment: .top){
                Text(ideaItem.text)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding()
                    
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
    let idea = Idea(text: "Helloka")
    return IdeaItem(ideaItem: idea)
}
