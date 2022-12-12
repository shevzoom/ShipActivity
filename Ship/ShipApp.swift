//
//  ShipApp.swift
//  Ship
//
//  Created by Глеб on 29.11.2022.
//

import SwiftUI

@main
struct ShipApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(activitymanager: ShipActivityManager())
        }
    }
}
