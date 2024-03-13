//
//  BaseBackground.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 11/03/2024.
//

import SwiftUI

struct BaseBackground<Content: View>: View {
    
    let title: String
    let isSettingsVisible: Bool
    let content: Content
    
    var body: some View {
        ZStack{
            VStack(){
                Header(title: title, isSettingsVisible: isSettingsVisible)
                content
                Spacer()
                
            } .border(.white, width: 1)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 2))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .leading)
        }.frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .cornerRadius(25)
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .padding(5)
            .background(Color.black)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

        
        
    }
}

struct Header: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    var onSettingsClick: OnSettingsClick?
    var title: String
    var isSettingsVisible: Bool
    
    var body: some View {
        HStack{
            Text(title).foregroundColor(.white)
            Spacer()
            if isSettingsVisible {
                Image(systemName: "gearshape").onTapGesture(perform: {
                    coordinator.push(page: .settings)
                }).foregroundColor(.white)
            }
        }.padding()
    }
}

protocol OnSettingsClick{
    func onSettingsClick()
}


extension OnSettingsClick{
    
    func onSettingsClick(){
        print("hi")
    }
}


#Preview {
    BaseBackground(title:" ",isSettingsVisible : true,content:
                    HStack(content: {
        Text("Hello base background")
    }))
}
