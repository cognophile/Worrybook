//
//  RefocusListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct RefocusListRow: View {
    private let colorHelper = ColorHelper()

    var refocus: Refocus

    var body: some View {
        VStack {
            Text("\(refocus.getTitle())")
                .fontWeight(.regular)
                .foregroundColor(colorHelper.getTextColor())
                .font(.body)
                .padding(10)
        }
    }
}
