//
//  AddIdeaViewModel.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation
import CoreData

class AddIdeaViewModel: ObservableObject{
    
    func addIdea(idea: String, isDraft: Bool = false,context: NSManagedObjectContext){
        BeAStoicController.shared.addIdea(text: idea, isDraft: isDraft, context: context)
    }
    
}
