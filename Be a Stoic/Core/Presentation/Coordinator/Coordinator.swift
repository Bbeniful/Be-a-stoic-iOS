//
//  Coordinator.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

enum Page: Hashable{
    case list
    case add
}

class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func push(page: Page){
        path.append(page)
    }
    
    func popBack(){
        path.removeLast()
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .list:
            AllIdeaView()
        case .add:
            AddIdea()
        }
    }
}
