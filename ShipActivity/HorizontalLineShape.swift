//
//  HorizontalLineShape.swift
//  ShipActivityExtension
//
//  Created by Глеб on 08.12.2022.
//

import SwiftUI

public struct HorizontalLineShape: Shape {
    private let width: CGFloat

    public init(width: CGFloat) {
        self.width = width
    }

    public func path(in _: CGRect) -> Path {
        return Path {
            $0.move(to: CGPoint(x: 0.0, y: 0.0))
            $0.addLine(to: CGPoint(x: width, y: 0.0))
        }
    }
}
