//
//  ShipStatusBuilder.swift
//  ShipActivityExtension
//
//  Created by Глеб on 10.12.2022.
//

import SwiftUI

public final class ShipStatusBuilder {
    private let orderStatus: OrderStatus
    private let possibleOrderStatuses: [OrderStatus] = [
        .packing, .inTransit, .delivered, .cancelled
    ]
    

    public init(
        orderStatus: OrderStatus
    ) {
        self.orderStatus = orderStatus
    }
}

// MARK: - ShipStatusBuilding

extension ShipStatusBuilder {
    public func buildStatusViewModel() -> ShipStatusViewModel {
        let viewModels = buildModels(
            activeStatus: orderStatus,
            allStatuses: possibleOrderStatuses
        )
        
        return ShipStatusViewModel(
            orderStatus: orderStatus,
            statusSections: viewModels
        )

    }
}

// MARK: - Helpers

private extension ShipStatusBuilder {
    func buildModels(
        activeStatus: OrderStatus,
        allStatuses: [OrderStatus]
    ) -> [ShipStatusModel] {
        var models = [ShipStatusModel]()

        for status in allStatuses {
            let shouldDisplayLeftLine = status != allStatuses.first
            let shouldDisplayRightLine = status != allStatuses.last
            
            let lineColors = getLineColors(activeStatus: activeStatus, status: status)

            models.append(ShipStatusModel(
                status: status,
                shouldDisplayLeftLine: shouldDisplayLeftLine,
                shouldDisplayRightLine: shouldDisplayRightLine,
                leftLineColor: lineColors.leftLineColor,
                rightLineColor: lineColors.rightLineColor
            ))
        }

        return models
    }
    
    func getLineColors(activeStatus: OrderStatus, status: OrderStatus) -> (leftLineColor: Color, rightLineColor: Color) {
        let leftLineColor: Color
        let rightLineColor: Color

        if activeStatus == .cancelled {
            leftLineColor = .red.opacity(0.7)
            rightLineColor = leftLineColor
        } else {
            if status == activeStatus {
                leftLineColor = .green
                rightLineColor = .gray
            } else {
                if status <= activeStatus {
                    leftLineColor = .green
                    rightLineColor = .green
                } else {
                    leftLineColor = .gray
                    rightLineColor = .gray
                }
            }
        }

        return (leftLineColor, rightLineColor)
    }
}

// MARK: - OrderStatus private

private extension OrderStatus {
    static func > (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
        lhs.id > rhs.id
    }

    static func <= (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
        lhs.id <= rhs.id
    }
}
