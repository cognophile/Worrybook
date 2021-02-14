//
//  WorryCategorisationAndRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryCategorisationAndRefocusView: View {
    private var worry: Worry
    
    @State private var selectedCategory = UUID()
    @State private var selectedRefocus = UUID()
    
    private let colorHelper = ColorHelper()
    private var categories: [Category]
    private var refocuses: [Refocus]
    private var categoryController = CategoriesController()
    private var refocusController = RefocusController()

    init(worry: Worry) {
        self.worry = worry
        self.categories = categoryController.getAll()
        self.refocuses = refocusController.getAll()
    }
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text("Categorise this worry")
                        .fontWeight(.medium)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.headline)
                        .padding(10)
                }
                
                ForEach(self.categories, id: \.id) { category in
                    if (self.selectedCategory == category.id) {
                        HStack {
                            Button(action: {
                                self.selectedCategory = UUID()
                            }) {
                                HStack {
                                    Text("\(category.getTitle())")
                                        .padding(5)
                                        .font(.footnote)
                                        .padding(5)
                                        .foregroundColor(.white)
                                        .background(colorHelper.primaryColor)
                                        .cornerRadius(50)
                                }
                                .frame(minWidth: 20, maxWidth: .infinity)
                                .padding(0)
                                
                                Spacer()
                            }
                        }
                    }
                    else {
                        HStack {
                            Button(action: {
                                self.selectedCategory = category.id
                            }) {
                                HStack {
                                    Text("\(category.getTitle())")
                                        .padding(5)
                                        .font(.footnote)
                                        .foregroundColor(colorHelper.getTextColor())
                                }
                                .frame(minWidth: 20, maxWidth: .infinity)
                                .padding(0)
                                
                                Spacer()
                            }
                        }
                    }
                }
            }

            Divider()
                .padding(10)

            Group {
                HStack {
                    Text("How will you refocus?")
                        .fontWeight(.medium)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.headline)
                        .padding(10)
                }
                
                ForEach(self.refocuses, id: \.id) { refocus in
                    if (self.selectedRefocus == refocus.id) {
                        HStack {
                            Button(action: {
                                self.selectedRefocus = UUID()
                            }) {
                                HStack {
                                    Text("\(refocus.getTitle())")
                                        .padding(5)
                                        .font(.footnote)
                                        .padding(5)
                                        .foregroundColor(.white)
                                        .background(colorHelper.primaryColor)
                                        .cornerRadius(50)
                                }
                                .frame(minWidth: 20, maxWidth: .infinity)
                                .padding(0)
                                
                                Spacer()
                            }
                        }
                    }
                    else {
                        HStack {
                            Button(action: {
                                self.selectedRefocus = refocus.id
                            }) {
                                HStack {
                                    Text("\(refocus.getTitle())")
                                        .padding(5)
                                        .font(.footnote)
                                        .foregroundColor(colorHelper.getTextColor())
                                }
                                .frame(minWidth: 20, maxWidth: .infinity)
                                .padding(0)
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "checkmark")
                        .font(.title2)
                    Text("Save")
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

