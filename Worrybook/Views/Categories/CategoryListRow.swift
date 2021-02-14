//
//  CategoryListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CategoryListRow: View {
    private let colorHelper = ColorHelper()

    var category: Category

    var body: some View {
        VStack {
            Text("\(category.getTitle())")
                .fontWeight(.regular)
                .foregroundColor(colorHelper.getTextColor())
                .font(.body)
                .padding(10)
        }
    }
}
