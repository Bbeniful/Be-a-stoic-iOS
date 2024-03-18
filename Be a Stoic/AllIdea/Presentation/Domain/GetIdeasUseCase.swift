//
//  GetIdeasUseCase.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 18/03/2024.
//

import Foundation
import CoreData

class GetIdeasUseCase{
    
    func execute(context: NSManagedObjectContext) -> [Idea] {
        do {
            return try BeAStoicController.shared.getAllIdea(context: context)!.map{ $0.toIdea() }
        } catch {
            print("Cannot load data...", error)
            return []
        }
    }
}
