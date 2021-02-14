//
//  MenuView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct MenuView: View {
    let width: CGFloat
    let isOpen: Bool
    let closeMenu: () -> Void
    
    private let colorHelper = ColorHelper()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(colorHelper.primaryColor.opacity(0.8))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeInOut.delay(0.25))
            .onTapGesture {
                self.closeMenu()
            }
                        
            HStack {
                MenuContentView()
                    .frame(width: self.width)
                    .background(colorHelper.getSchemeColour())
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}
