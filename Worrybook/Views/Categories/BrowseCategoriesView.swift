//
//  BrowseCategoriesView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseCategoriesView: View {
    @Binding var show: Bool
    
    @Environment(\.presentationMode) var presentation
    
    @State private var categories: [CategoryViewModel]
    @State private var confirmDeletion = false
    @State private var category: CategoryViewModel = CategoryViewModel(title: nil)
    
    let controller = CategoriesController()
    private let colorHelper = ColorHelper()
    
    init(show: Binding<Bool>) {
        self._show = show
        self._categories = .init(initialValue: [CategoryViewModel]())
    }
    
    private func populate() {
        self.categories = self.controller.getAll()
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { i in
            self.category.setId(id: self.categories[i].getId()!)
        }

        self.confirmDeletion.toggle()
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(self.categories, id: \.id) { category in
                    CategoryListRow(category: category)
                }
                .onDelete(perform: self.delete)
            }
            .modifier(EmptyDataModifier(
                items: self.categories,
                placeholder:
                        VStack {
                            Image(systemName: "questionmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(self.colorHelper.getTextColor())
                                .padding(.bottom, 10)
                            Text("No categories found!")
                                .fontWeight(.semibold)
                                .font(.title2)
                                .padding(.bottom, 20)
                                .foregroundColor(self.colorHelper.getTextColor())
                            Text("Find yourself worrying about similar things? You can add one below!")
                                .font(.body)
                                .foregroundColor(self.colorHelper.getTextColor())
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                        .padding([.top], 20)
                        .padding([.bottom], 50)
                        .padding([.leading, .trailing], 10)
            ))
        }
        .onAppear(perform: self.populate)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshCategoryListNotification"))) { _ in
            self.populate()
        }
        .alert(isPresented: self.$confirmDeletion) {
            Alert(
                title: Text("Wait..."),
                message: Text("Just checking - are you sure you wish to delete this category?"),
                primaryButton: .destructive(Text("I'm sure")) {
                    let result = self.controller.delete(id: self.category.getId() ?? 0)
                    
                    if (result) {
                        NotificationCenter.default.post(
                            Notification.init(name: Notification.Name(rawValue: "RefreshCategoryListNotification"))
                        )
                        self.presentation.wrappedValue.dismiss()
                    }
                },
                secondaryButton: .cancel(Text("No, don\'t!"))
            )
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
