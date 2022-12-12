//
//  ShipActivityEntryView.swift
//  ShipActivityExtension
//
//  Created by Глеб on 10.12.2022.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct Constants {
    static let backgroundColor: Color = Color(#colorLiteral(red: 0.06763830036, green: 0.2192802131, blue: 0.1827280223, alpha: 1))
    static let compactPadding: CGFloat = 16
    static let cirlesViewPadding: CGFloat = 128
    static let dashedLinePadding: CGFloat = 13
    static let stackSpacing: CGFloat = 10
    static let space: String = "ShipActivity"
}

struct ShipActivityEntryView : View {
    let context: ActivityViewContext<ShipAttributes>
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(spacing: Constants.stackSpacing) {
                liveStatusView
                
                Spacer()
                
                Text(context.state.status.title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .position(x: context.state.status.textPaddingg)
            }
        }
        .padding(.all, Constants.compactPadding)
        .background(Constants.backgroundColor)
        
    }
    
    private var liveStatusView: some View {
        ZStack(alignment: .top) {
            HStack(spacing: 0) {
                ForEach(OrderStatus.allCases.indices) { statusSections in
                    let model = ShipStatusBuilder(
                        orderStatus: context.state.status
                    ).buildStatusViewModel()
                    
                    ShipStatusCirlesView(context: context, viewModel: model.statusSections[statusSections])
                    
                }
            }
            GeometryReader { geo in
                circleStatusView()
                    .position(x: geo.size.width / 2.0, y: geo.size.height / 2.0)
            }
        }
    }
    
    private func circleStatusView() -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(OrderStatus.allCases, id: \.self) { status in
                return Image(systemName: status.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .foregroundColor(context.state.status == status ? .green : .white)
                    .background {
                        Circle()
                            .fill(context.state.status == status ? .white : .green)
                            .frame(width: 24, height: 24)
                    }
                    .background {
                        Circle()
                            .fill(context.state.status == status ? .white : .green)
                            .if(context.state.status == status) { view in
                                view.frame(width: 32, height: 32)
                            }
                    }
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
