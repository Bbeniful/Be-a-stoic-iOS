//
//  AllIdeaViewModel.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation

class AllIdeaViewModel: ObservableObject{
    
    @Published var ideas: [Idea] = []
    
    
    func getAllIdea() -> [Idea]{
        return [Idea(text: "swift idea", isShared: false, isDraft: false)]
    }
    
    /*
     let fetchRequest = NSFetchRequest()
     fetchRequest.entity = NSEntityDescription.entityForName("ENTITY_NAME", inManagedObjectContext: managedObjectContext)
     fetchRequest.propertiesToFetch = ["property1","property2"]
     fetchRequest.resultType = .DictionaryResultType
     */
    
}
