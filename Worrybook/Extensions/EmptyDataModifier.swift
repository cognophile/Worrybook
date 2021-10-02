//
//  EmptyDataModifier.swift
//  Worrybook
//
//  Created by cognophile
//      Ref: https://toxa95401.medium.com/empty-list-placeholder-swiftui-4553e0e79f8e
//

import Foundation
import SwiftUI

struct EmptyDataModifier<Placeholder: View>: ViewModifier {
    
    let items: [Any]
    let placeholder: Placeholder
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if !items.isEmpty {
            content
        } else {
            placeholder
        }
    }
}
