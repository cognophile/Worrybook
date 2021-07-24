//
//  WorryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryListRow: View {
    public var worry: WorryViewModel

    private let colorHelper = ColorHelper()

    var body: some View {
        NavigationLink(destination: DetailWorryView(viewModel: self.worry)) {
            VStack {
                Text("\(self.worry.getTitle())")
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
            }
            Spacer()
            VStack {
                Text("\(self.worry.getCreatedDate())")
                    .fontWeight(.light)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.caption)
                    .padding(10)
            }
        }
    }
}
