//
//  TechniqueListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct TechniqueListRow: View {
    private let colorHelper = ColorHelper()

    var technique: Technique
    @State private var showDescription = false

    var body: some View {
        VStack {
            Button(action: {
                self.showDescription.toggle()
            }) {
                Text("\(technique.getTitle())")
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
            }
            .alert(isPresented: self.$showDescription) {
                Alert(
                    title: Text("\(technique.getTitle())"),
                    message:
                        Text("\(technique.getDescription())"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        }
    }
}

