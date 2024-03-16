//
//  IdeaController.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation
import CoreData

class IdeaController: ObservableObject{
    
    let container = NSPersistentContainer(name: "IdeaModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            
            if let error = error {
                print("Failed to create data... \(error.localizedDescription)")
            }
        }
    }
    
    func saveUserName(userName: String, context: NSManagedObjectContext) throws{
        let userSetting: UserSettings!
        let personFetchRequest: NSFetchRequest<UserSettings> = UserSettings.fetchRequest()
        let userSettings = try context.fetch(personFetchRequest)
        
        if userSettings.count == 0 {
            userSetting = UserSettings(context: context)
        } else {
            userSetting = userSettings.first
        }
        userSetting.id = UUID()
        userSetting.userName = userName
        save(context: context)
    }
    
    func getUserSettings(context: NSManagedObjectContext) throws -> UserSettings? {
        let personFetchRequest: NSFetchRequest<UserSettings> = UserSettings.fetchRequest()
        let userSetting = try context.fetch(personFetchRequest)
        userSetting.forEach { item in
            print(item.userName)
        }
        return userSetting.first
        
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        } catch{
            print("Can't save the data")
        }
    }
    
    func addIdea(text: String,isDraft: Bool, content: String, context: NSManagedObjectContext){
        let idea = MyIdeaModel(context: context)
        idea.id = UUID()
        idea.text = text
        idea.isDraft = isDraft
        save(context: context)
    }
    
}
