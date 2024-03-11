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
        ZStack{
            VStack{
                HStack{
                    Text("Hello")
                        .foregroundColor(.white)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(12)
                
                ForEach((1...10), id: \.self){ idea in
                    IdeaItem(ideaItem: Idea(text: "Hi, \(idea)"))
                    
                }
                Spacer()
                Button(action: {
                    coordinator.push(page: .add)
                }, label: {
                    Text("Button")
                }).padding(.bottom,22)
                    .padding(.trailing, 22)
                    .frame(maxWidth: .infinity,alignment: .trailing)
            }
            .border(.white, width: 1)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.white, lineWidth: 2))
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .leading)
        }
        .cornerRadius(25)
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .padding(5)
        .background(Color.black)
        
    }
}


private struct IdeaItem: View {
    var ideaItem: Idea
    
    var body : some View {
        Text(ideaItem.text)
    }
}



#Preview {
    AllIdeaView()
}
