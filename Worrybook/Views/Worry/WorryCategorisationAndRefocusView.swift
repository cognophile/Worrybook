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
    
    @State private var selectedCategory = 0
    @State private var selectedRefocus = 0
    @State private var operationFailed = false
    @State private var invalidFields = false
    @State private var validationMessage = ""
    @State private var createdModel: WorryViewModel = WorryViewModel()
    
    private let colorHelper = ColorHelper()
    private var categories: [CategoryViewModel]
    private var refocuses: [RefocusViewModel]
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
                        .font(.subheadline)
                        .padding(10)
                }
                
                ForEach(self.categories, id: \.id) { category in
                    if (self.selectedCategory == category.id) {
                        HStack {
                            Button(action: {
                                self.selectedCategory = category.id ?? 1
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
                                self.selectedCategory = category.id ?? 1
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
        

            Group {
                if (self.viewModel.getType() == WorryTypeViewModel.hypothetical) {
                    Divider()
                        .padding(10)
                    
                    HStack {
                        Text("How will you refocus?")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.subheadline)
                            .padding(10)
                    }
                    
                    ForEach(self.refocuses, id: \.id) { refocus in
                        if (self.selectedRefocus == refocus.id) {
                            HStack {
                                Button(action: {
                                    self.selectedRefocus = refocus.id ?? 1
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
                                    self.selectedRefocus = refocus.id ?? 1
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
            }
            
            Spacer()
            Button(action: {
                if (self.viewModel.getType() == WorryTypeViewModel.hypothetical) {
                    self.validationMessage = "You need to select a category and something to refocus on"
                    
                    if (self.selectedRefocus > 0 && self.selectedCategory > 0) {
                        let refocusViewModel = refocusController.getOne(id: self.selectedRefocus)
                        let categoryViewModel = categoryController.getOne(id: self.selectedCategory)
                        
                        self.viewModel.setRefocus(refocus: refocusViewModel)
                        self.viewModel.setCategory(category: categoryViewModel)
                        self.createdModel = worryController.create(viewModel: self.viewModel)
                        
                        if (self.createdModel.id != nil) {
                            self.presentationMode.wrappedValue.dismiss()
                            NotificationCenter.default.post(
                                Notification.init(name: Notification.Name(rawValue: "WorrySavedNotification"))
                            )
                        }
                        else {
                            self.operationFailed.toggle()
                        }
                    }
                    else {
                        self.invalidFields = true
                    }
                }
                else {
                    self.validationMessage = "You need to select a category to proceed"
                    
                    if (self.selectedCategory > 0) {
                        let categoryViewModel = categoryController.getOne(id: self.selectedCategory)
                        
                        self.viewModel.setCategory(category: categoryViewModel)
                        self.createdModel = worryController.create(viewModel: self.viewModel)
                        
                        if (self.createdModel.id != nil) {
                            self.presentationMode.wrappedValue.dismiss()
                            NotificationCenter.default.post(
                                Notification.init(name: Notification.Name(rawValue: "WorrySavedNotification"))
                            )
                        }
                        else {
                            self.operationFailed.toggle()
                        }
                    }
                    else {
                        self.invalidFields = true
                    }
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
            .alert(isPresented: self.$invalidFields) {
                Alert(
                    title: Text("Hang on..."),
                    message: Text("\(self.validationMessage)"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        }
    }
}

