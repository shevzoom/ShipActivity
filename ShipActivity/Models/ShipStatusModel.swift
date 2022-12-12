//
//  ShipStatusModel.swift
//  ShipActivityExtension
//
//  Created by Глеб on 10.12.2022.
//

import SwiftUI

public struct ShipStatusModel: Identifiable {
    public var id: OrderStatus {
        status
    }

    var status: OrderStatus
    var shouldDisplayLeftLine: Bool
    var shouldDisplayRightLine: Bool
    var leftLineColor: Color
    var rightLineColor: Color

    public init(
        status: OrderStatus,
        shouldDisplayLeftLine: Bool,
        shouldDisplayRightLine: Bool,
        leftLineColor: Color,
        rightLineColor: Color
    ) {
        self.status = status
        self.shouldDisplayLeftLine = shouldDisplayLeftLine
        self.shouldDisplayRightLine = shouldDisplayRightLine
        self.leftLineColor = leftLineColor
        self.rightLineColor = rightLineColor
    }
}
