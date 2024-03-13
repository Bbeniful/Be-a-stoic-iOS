//
//  AddIdea.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

struct AddIdea: View {

    
    @State var viewModel = AddIdeaViewModel()
    
    var body: some View {
       BaseBackground(title:"Add", isSettingsVisible: false, shouldNavigateBack: true,
                      content: VStack{
           
       })
    }
}

#Preview {
    AddIdea()
}
