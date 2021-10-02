//
//  GratitudeDiaryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct GratitudeDiaryListRow: View {
    private let colorHelper = ColorHelper()

    var entry: GratitudeDiaryEntryViewModel

    var body: some View {
        NavigationLink(destination: DetailGratitudeDiaryView(entry: self.entry)) {
            VStack {
                Text("\(entry.getCreatedDate())")
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
            }
        }
    }
}
