//
//  Be_a_StoicApp.swift
//  Be a Stoic
//
//  Created by Benjámin Szilágyi on 08/03/2024.
//

import SwiftUI

@main
struct Be_a_StoicApp: App {
    
    @StateObject private var ideaController = IdeaController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, ideaController.container.viewContext)
        }
    }
}
