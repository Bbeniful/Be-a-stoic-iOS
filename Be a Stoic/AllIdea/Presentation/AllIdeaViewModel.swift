//
//  AllIdeaViewModel.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation
import CoreData

class AllIdeaViewModel: ObservableObject{
    
    @Published var ideas: [Idea]? = []
    
    init(ideas: [Idea]? = []) {
        self.ideas = ideas
    }
    
    
    func getAllIdea(context: NSManagedObjectContext) {
        self.ideas = GetIdeasUseCase().execute(context: context)
    }
}
