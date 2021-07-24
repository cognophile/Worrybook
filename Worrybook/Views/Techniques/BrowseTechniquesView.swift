//
//  BrowseTechniquesView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseTechniquesView: View {
    @Binding var show: Bool
    
    @State private var techniques: [TechniqueViewModel]
    
    var controller = TechniquesController()
    private let colorHelper = ColorHelper()
    
    init(show: Binding<Bool>) {
        self._show = show
        self._techniques = .init(initialValue: controller.getAll())
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(self.techniques, id: \.id) { technique in
                    TechniqueListRow(technique: technique)
                }
                .onDelete { $0.forEach {
                        self.techniques.remove(at: $0)
                    }
                }
            }
        }
        
        Spacer()
        HStack {
            NavigationLink(destination: CreateTechniqueView()) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2)
                    Text("Add a technique")
                        .fontWeight(.semibold)
                        .font(.title2)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(10)
                .foregroundColor(.white)
                .background(colorHelper.primaryColor)
                .cornerRadius(50)
                .padding(10)
            }
        }
    }
}

