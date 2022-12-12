//
//  ActivityManager.swift
//  Ship
//
//  Created by Глеб on 05.12.2022.
//

import Foundation
import ActivityKit
import Combine

protocol ShipActivityManagerProtocol {
    func endLiveActivity()
    func updateLiveActivity(updatedStatus: OrderStatus)
    func addLiveActivity() -> String?
}

final class ShipActivityManager: ShipActivityManagerProtocol {
    
    func endLiveActivity() {
        guard let activity = Activity<ShipAttributes>.activities.first else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Task {
                await activity.end(using: activity.contentState, dismissalPolicy: .immediate)
            }
        }
    }
    
    func updateLiveActivity(updatedStatus: OrderStatus) {
        guard let activity = Activity<ShipAttributes>.activities.first else {
            return
        }
        
        DispatchQueue.main.async {
            var updatedState = activity.contentState
            updatedState.status = updatedStatus
            
            Task {
                await activity.update(using: updatedState)
            }
        }
    }
    
    func addLiveActivity() -> String? {
        let state = ShipAttributes.ContentState()
        
        // TODO: appending array data from service
        let attributes = ShipAttributes(
            orderNumber: 1,
            orderItems: [
            "burger",
            "coke"
        ])
        
        do {
            let activity = try? Activity<ShipAttributes>.request(
                attributes: attributes,
                contentState: state
            )
            
            return activity?.id
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
}
