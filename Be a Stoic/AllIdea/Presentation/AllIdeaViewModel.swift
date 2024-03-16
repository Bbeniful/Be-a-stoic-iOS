//
//  AllIdeaViewModel.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation
import CoreData

class AllIdeaViewModel: ObservableObject{
    
    @Published var ideas: [MyIdeaModel]? = []
    
    init(ideas: [MyIdeaModel]? = []) {
        self.ideas = ideas
    }
    
    
    func getAllIdea(context: NSManagedObjectContext) {
        do {
            try self.ideas = BeAStoicController.shared.getAllIdea(context: context)
        } catch {
            print("Cannot load data...")
        }
    }
}
