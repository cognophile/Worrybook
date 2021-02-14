//
//  BrowseRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseRefocusView: View {
    @Binding var show: Bool
    @State private var refocuses: [Refocus]
    
    var controller = RefocusController()
    private let colorHelper = ColorHelper()
    
    init(show: Binding<Bool>) {
        self._show = show
        self._refocuses = .init(initialValue: controller.getAll())
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(self.refocuses, id: \.id) { refocus in
                    RefocusListRow(refocus: refocus)
                }
                .onDelete { $0.forEach {
                        self.refocuses.remove(at: $0)
                    }
                }
            }
        }
        
        Spacer()
        HStack {
            NavigationLink(destination: CreateRefocusView()) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2)
                    Text("Add a method")
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
