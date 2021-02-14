//
//  WorryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryListRow: View {
    private let colorHelper = ColorHelper()

    var worry: Worry

    var body: some View {
        NavigationLink(destination: DetailWorryView(worry: self.worry)) {
                Text(worry.getTitle())
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
        }
    }
}
