//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by DataBunker on 2022-10-20.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
