//
//  TabatUpApp.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 24/10/22.
//

import SwiftUI

@main
struct TabatUpApp: App {
    
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
