//
//  WorryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryListRow: View {
    private let colorHelper = ColorHelper()

    var viewModel: WorryViewModel

    var body: some View {
        NavigationLink(destination: DetailWorryView(viewModel: self.viewModel)) {
            Text(viewModel.worry.getTitle())
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
        }
    }
}
