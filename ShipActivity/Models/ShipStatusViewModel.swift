//
//  ShipStatusViewModel.swift
//  ShipActivityExtension
//
//  Created by Глеб on 10.12.2022.
//

import SwiftUI

public class ShipStatusViewModel: ObservableObject {

    let orderStatus: OrderStatus
    var statusSections: [ShipStatusModel]

    public init(
        orderStatus: OrderStatus,
        statusSections: [ShipStatusModel]
    ) {
        self.orderStatus = orderStatus
        self.statusSections = statusSections
    }
}

