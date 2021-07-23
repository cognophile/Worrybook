//
//  BrowseCategoriesView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseCategoriesView: View {
    @Binding var show: Bool
    @State private var categories: [CategoryViewModel]
    
    var controller = CategoriesController()
    private let colorHelper = ColorHelper()
    
    init(show: Binding<Bool>) {
        self._show = show
        self._categories = .init(initialValue: controller.getAll())
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(self.categories, id: \.id) { category in
                    CategoryListRow(category: category)
                }
                .onDelete { $0.forEach {
                        self.categories.remove(at: $0)
                    }
                }
            }
        }
        
        Spacer()
        HStack {
            NavigationLink(destination: CreateCategoryView()) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2)
                    Text("Add a category")
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
