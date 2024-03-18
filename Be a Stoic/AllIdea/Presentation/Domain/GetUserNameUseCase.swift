//
//  GetUserNameUseCase.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 18/03/2024.
//

import Foundation
import CoreData

class GetUserNameUseCase{
    
    func execute(context: NSManagedObjectContext) -> String? {
        do{
            return try BeAStoicController.shared.getUserSettings(context: context)?.userName
        } catch {
            print("Name is empty", error)
            return ""
        }
    }
}
