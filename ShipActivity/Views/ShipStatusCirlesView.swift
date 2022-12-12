//
//  ShipStatusCirlesView.swift
//  ShipActivityExtension
//
//  Created by Глеб on 06.12.2022.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct ShipStatusCirlesView: View {
    let context: ActivityViewContext<ShipAttributes>
    let viewModel: ShipStatusModel
    
    var body: some View {
        HStack {
            GeometryReader { geo in
                
                if viewModel.shouldDisplayLeftLine {
                    Path { path in
                        let cgpoint = geo.size.width / 2.0
                        path.move(to: CGPoint(x: cgpoint, y: geo.size.height / 2.0))
                        path.addLine(to: CGPoint(x: 0.0, y: geo.size.height / 2.0))
                    }
                    .stroke()
                    .foregroundColor(viewModel.leftLineColor)
                }
                
                if viewModel.shouldDisplayRightLine {
                    Path { path in
                        let cgpoint = geo.size.width / 2.0
                        path.move(to: CGPoint(x: cgpoint, y: geo.size.height / 2.0))
                        path.addLine(to: CGPoint(x: geo.size.width, y: geo.size.height / 2.0))
                    }
                    .stroke()
                    .foregroundColor(viewModel.rightLineColor)
                }
            }
        }
    }
}
