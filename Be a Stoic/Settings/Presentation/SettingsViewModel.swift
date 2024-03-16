//
//  SettingsViewModel.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 13/03/2024.
//

import Foundation
import CoreData


class SettingsViewModel: ObservableObject {
    
    @Published var userName: String?
    
    init(userName: String? = "") {
        self.userName = userName
    }
    
    func save(userName: String, context: NSManagedObjectContext){
        do{
           try BeAStoicController.shared.saveUserName(userName: userName, context: context)
        } catch {
            print("Cannot save new name")
        }
    }
    
    func getUserSettings(context: NSManagedObjectContext){
        do{
            self.userName = try BeAStoicController.shared.getUserSettings(context: context)?.userName
        }catch{
            print("Cannot load user name")
        }
    }
    
}
