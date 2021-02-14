//
//  RoundedCornerBorderTextFieldExtension.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI

struct RoundedCornerBorderTextFieldExtension: TextFieldStyle {
    private let colorHelper = ColorHelper()

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(colorHelper.secondaryColor, lineWidth: 1)
            )
    }
}
