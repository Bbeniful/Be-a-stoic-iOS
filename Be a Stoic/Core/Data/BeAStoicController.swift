//
//  IdeaController.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import Foundation
import CoreData

class BeAStoicController: ObservableObject{
    
    static let shared = BeAStoicController()

    let container = NSPersistentContainer(name: "IdeaModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            
            if let error = error {
                print("Failed to create data... \(error.localizedDescription)")
            }
        }
    }
    
    func saveUserName(userName: String, context: NSManagedObjectContext) throws {
        let userSetting: UserSettings!
        let userSettingsFetchRequest: NSFetchRequest<UserSettings> = UserSettings.fetchRequest()
        let userSettings = try context.fetch(userSettingsFetchRequest)
        
       /* if userSettings.count == 0 {
            userSetting = UserSettings(context: context)
        } else {
            userSetting = userSettings.first
        }*/
        userSetting = userSettings.count == 0 ? UserSettings(context: context) : userSettings.first
        
        userSetting.id = UUID()
        userSetting.userName = userName
        save(context: context)
    }
    
    func getUserSettings(context: NSManagedObjectContext) throws -> UserSettings? {
        let userSettingsFetchRequest: NSFetchRequest<UserSettings> = UserSettings.fetchRequest()
        let userSetting = try context.fetch(userSettingsFetchRequest)
        return userSetting.first
        
    }
    
    func getAllIdea(context: NSManagedObjectContext) throws -> [MyIdeaModel]?{
        let ideaFetchRequest : NSFetchRequest<MyIdeaModel> = MyIdeaModel.fetchRequest()
        let ideas = try context.fetch(ideaFetchRequest)
        return ideas
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data saved")
        } catch{
            print("Can't save the data")
        }
    }
    
    func addIdea(text: String,isDraft: Bool, context: NSManagedObjectContext){
        let idea = MyIdeaModel(context: context)
        idea.id = UUID()
        idea.text = text
        idea.isDraft = isDraft
        save(context: context)
    }
    
}
