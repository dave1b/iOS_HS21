//
//  PresistencyApp.swift
//  Presistency
//
//  Created by Dave Brunner on 09.11.21.
//

import SwiftUI

@main
struct PresistencyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
