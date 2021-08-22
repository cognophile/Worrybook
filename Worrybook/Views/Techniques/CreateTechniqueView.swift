//
//  CreateTechniqueView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CreateTechniqueView: View {
    let colorHelper = ColorHelper()
    var controller = TechniquesController ()
    
    @Environment(\.presentationMode) var presentation

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var operationFailed = false
    @State private var createdModel: TechniqueViewModel = TechniqueViewModel(title: nil, description: nil)
    
    var body: some View {
        VStack {
            HStack {
                Text("What's your technique?")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.title)
                    .padding(10)
            }
            
            HStack {
                TextField("Title", text: self.$title)
                    .frame(minHeight: 50)
                    .foregroundColor(.gray)
                    .background(Color(UIColor.systemBackground))
                    .textFieldStyle(RoundedCornerBorderTextFieldExtension())
                    .padding(10)
            }
            
            HStack {
                Text("What is it?")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.body)
                    .padding(10)
            }
            
            HStack {
                TextEditor(text: self.$description)
                    .frame(minHeight: 50)
                    .foregroundColor(.gray)
                    .background(Color(UIColor.systemBackground))
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(colorHelper.secondaryColor, lineWidth: 1)
                    )
                    .padding(10)
            }
        }
            
        Spacer()
            
        Button(action: {
            let technique = TechniqueViewModel(title: self.title, description: self.description)
            self.createdModel = controller.create(viewModel: technique)
            
            if (self.createdModel.id != nil) {
                self.presentation.wrappedValue.dismiss()
                NotificationCenter.default.post(
                    Notification.init(name: Notification.Name(rawValue: "RefreshTechniqueListNotification"))
                )
            }
            else {
                self.operationFailed.toggle()
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
                message: Text("Looks like something went wrong - sorry about that :( \n\nPlease try again. If you continue to encounter issues, please report the issue via GitHub."),
                dismissButton: .default(Text("Okay"))
            )
        }
    }
}
