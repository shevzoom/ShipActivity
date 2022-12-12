//
//  ShipActivityBundle.swift
//  ShipActivity
//
//  Created by Глеб on 29.11.2022.
//

import WidgetKit
import SwiftUI
import ActivityKit

@main
struct ShipActivityBundle: WidgetBundle {
    var body: some Widget {
        ShipActivity()
    }
}

struct ShipActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ShipAttributes.self) { context in
            ShipActivityEntryView(context: context)
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("")
                }
            } compactLeading: {
                
            } compactTrailing: {
                
            } minimal: {
                
            }
        }
    }
}
