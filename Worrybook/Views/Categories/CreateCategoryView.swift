//
//  CreateCategoryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CreateCategoryView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var operationFailed = false
    @State private var invalidFields = false
    @State private var title: String = ""
    @State private var category: CategoryViewModel = CategoryViewModel(title: nil)

    let controller = CategoriesController()
    let colorHelper = ColorHelper()
    
    var body: some View {
        VStack {
            HStack {
                Text("Create a Category")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.title)
                    .padding(10)
            }
            
            HStack {
                TextField("", text: self.$title)
                    .frame(minHeight: 50)
                    .foregroundColor(colorHelper.getTextColor())
                    .background(Color(UIColor.systemBackground))
                    .textFieldStyle(RoundedCornerBorderTextFieldExtension())
                    .padding(10)
            }
        }
            
        Spacer()
        Button(action: {
            if (!self.title.isEmpty) {
                self.category.setTitle(title: self.title)
                let created = self.controller.create(viewModel: self.category)
                
                if (created.id != nil) {
                    self.presentationMode.wrappedValue.dismiss()
                    NotificationCenter.default.post(
                        Notification.init(name: Notification.Name(rawValue: "RefreshCategoryListNotification"))
                    )
                }
                else {
                    self.operationFailed.toggle()
                }
            }
            else {
                self.invalidFields = true
            }
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .font(.title2)
                Text("Add")
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
                message: Text("Looks like something went wrong - sorry about that :( \n\nPlease try again. If you continue to encounter issues, please report the issue via the website."),
                dismissButton: .default(Text("Okay"))
            )
        }
        .alert(isPresented: self.$invalidFields) {
            Alert(
                title: Text("Hang on..."),
                message: Text("You need to enter a title for the category item."),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
}
