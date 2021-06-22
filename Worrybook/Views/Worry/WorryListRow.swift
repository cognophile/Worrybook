//
//  WorryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryListRow: View {
    public var viewModel: WorryViewModel

    private let colorHelper = ColorHelper()

    var body: some View {
        NavigationLink(destination: DetailWorryView(viewModel: self.viewModel)) {
            Text(viewModel.getTitle())
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
        }
    }
}
