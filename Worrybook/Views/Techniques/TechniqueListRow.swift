//
//  TechniqueListRow.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI
import PartialSheet

struct TechniqueListRow: View {
    private let colorHelper = ColorHelper()
    
    var technique: TechniqueViewModel
    @State private var showDescription = false

    @EnvironmentObject var partialSheet : PartialSheetManager
    
    var body: some View {
        VStack {            
            Button(action: {
                self.showDescription.toggle()
            }, label: {
                Text("\(technique.getTitle())")
                    .fontWeight(.regular)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
            })
            .partialSheet(isPresented: self.$showDescription) {
                VStack {
                    Text("\(technique.getTitle())")
                        .fontWeight(.bold)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.body)
                        .padding(10)
                    
                    Text("\(technique.getDescription())")
                        .fontWeight(.regular)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.body)
                        .padding(10)
                }
            }
        }
    }
}

