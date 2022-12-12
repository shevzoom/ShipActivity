//
//  Attributes.swift
//  Ship
//
//  Created by Глеб on 29.11.2022.
//

import Foundation
import ActivityKit
import SwiftUI

public enum OrderStatus: CaseIterable, Codable, Equatable , Identifiable {
    case packing
    case inTransit
    case delivered
    case cancelled
    
    var title: String {
        switch self {
            case .packing:
                return "Packing"
            case .inTransit:
                return "In transit"
            case .delivered:
                return "Delivered"
            case .cancelled:
                return "Cancelled"
        }
    }
    
    var image: String {
        switch self {
            case .packing:
                return "basket.fill"
            case .inTransit:
                return "stove.fill"
            case .delivered:
                return "takeoutbag.and.cup.and.straw.fill"
            case .cancelled:
                return "repeat.circle.fill"
        }
    }
    
    var textPaddingg: CGFloat  {
        switch self {
            case .packing:
                return  50
            case .inTransit:
                return  125
            case .delivered:
                return  220
            case .cancelled:
                return  300
        }
    }
    
    public var id: Int {
        switch self {
            case .packing:
                return 0
            case .inTransit:
                return 1
            case .delivered :
                return 2
            case .cancelled :
                return 3
        }
    }
}

struct ShipAttributes : ActivityAttributes {
    struct ContentState: Codable, Hashable {
        var status: OrderStatus = .packing
    }

    var orderNumber: Int
    var orderItems: [String]

}
