//
//  RefocusListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct RefocusListRow: View {
    var refocus: RefocusViewModel
    private let colorHelper = ColorHelper()

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
