//
//  View+.swift
//  Ship
//
//  Created by Глеб on 09.12.2022.
//

import SwiftUI

extension View {
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
