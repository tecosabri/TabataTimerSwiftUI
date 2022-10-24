//
//  TabatUpApp.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 24/10/22.
//

import SwiftUI

@main
struct TabatUpApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
