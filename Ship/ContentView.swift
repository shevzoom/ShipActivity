//
//  ContentView.swift
//  Ship
//
//  Created by Глеб on 29.11.2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    struct LocalConstants {
        static let statusSectionName: String = "Change status"
        static let startButtonName: String = "start"
        static let finishButtonName: String = "finish"
        static let buttonColor: UIColor = #colorLiteral(red: 0.1019935682, green: 0.9145864844, blue: 0.5046591759, alpha: 1)
    }
    
    @State private var currentActivityStatus: OrderStatus = .packing
    
    private var activitymanager: ShipActivityManagerProtocol
    
    init(activitymanager: ShipActivityManagerProtocol) {
        self.activitymanager = activitymanager
    }
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.07106474787, green: 0.1544084251, blue: 0.1963465512, alpha: 1))
                .ignoresSafeArea()
            
            VStack {
                startButton()
                    .padding(.bottom, 100)
                
                Section(LocalConstants.statusSectionName) {
                    pickerView
                        .padding(.bottom, 120)
                }
                .colorInvert()
                
                finishButton()
            }
            .onChange(of: currentActivityStatus) { newValue in
                activitymanager.updateLiveActivity(updatedStatus: newValue)
            }
        }
    }
    
    private var pickerView: some View {
        Picker(selection: $currentActivityStatus) {
            ForEach(OrderStatus.allCases) { status in
                Text(status.title)
                    .tag(status)
            }
        } label: {
        }
        .pickerStyle(.segmented)
        .padding([
            .leading,
            .trailing,
            .top
        ], 16)
    }
    
    private func startButton() -> some View {
        Button(LocalConstants.startButtonName) {
            activitymanager.addLiveActivity()
        }
        .frame(width: 100, height: 100)
        .foregroundColor(Color.white)
        .background(Color(LocalConstants.buttonColor))
        .clipShape(Circle())
    }
    
    private func finishButton() -> some View {
        Button(LocalConstants.finishButtonName) {
            activitymanager.endLiveActivity()
        }
        .frame(width: 100, height: 100)
        .foregroundColor(Color.white)
        .background(Color(LocalConstants.buttonColor))
        .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activitymanager: ShipActivityManager())
    }
}
