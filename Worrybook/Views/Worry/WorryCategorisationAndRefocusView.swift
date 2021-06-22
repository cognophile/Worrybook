//
//  WorryCategorisationAndRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct WorryCategorisationAndRefocusView: View {
    private var viewModel: WorryViewModel
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var selectedCategory = UUID()
    @State private var selectedRefocus = UUID()
    @State private var operationFailed = false
    @State private var createdModel: WorryViewModel = WorryViewModel()
    
    private let colorHelper = ColorHelper()
    private var categories: [Category]
    private var refocuses: [Refocus]
    private var worryController = WorryController()
    private var categoryController = CategoriesController()
    private var refocusController = RefocusController()
    
    init(viewModel: WorryViewModel) {
        self.viewModel = viewModel
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
//              self.viewModel.setCategory(category: T##Category)
//              self.viewModel.setRefocus(refocus: T##Refocus)
                self.createdModel = worryController.create(viewModel: self.viewModel)
                
                if (self.createdModel.recordId != nil) {
                    self.presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(
                        Notification.init(name: Notification.Name(rawValue: "WorrySavedNotifciation"))
                    )
                }
                else {
                    self.operationFailed.toggle()
                }
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
            .alert(isPresented: self.$operationFailed) {
                Alert(
                    title: Text("Oops!"),
                    message: Text("Looks like something went wrong - sorry about that :( \n\nPlease try again. If you continue to encounter issues, please report the issue via GitHub."),
                    dismissButton: .default(Text("Okay"))
                )
            }
            
        }
    }
}

