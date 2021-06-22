//
//  DetailWorryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct DetailWorryView: View {
    @Environment(\.presentationMode) var presentation
        
    @State private var operationFailed = false
    @State private var confirmDeletion = false
    
    private let colorHelper = ColorHelper()

    public var controller = WorryController()
    var viewModel: WorryViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("\(self.viewModel.getTitle())")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.title3)
                    .padding(10)
                
                Text("\(self.viewModel.getTypeString())")
                    .font(.caption)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(self.viewModel.getTypeColour())
                    .cornerRadius(50)
                    .padding(8)
            }
            
            Divider()
                .padding(10)
            
            Text("\(self.viewModel.getDescription())")
                .foregroundColor(.gray)
                .padding(20)
                .multilineTextAlignment(.center)

            
            if (self.viewModel.getType() == WorryTypeViewModel.practical) {
                Text("What you did about it")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.subheadline)
                    .padding(10)
                Text("\(self.viewModel.getSolution() ?? "")")
                    .foregroundColor(.gray)
                    .padding(20)
                    .multilineTextAlignment(.center)
            }
            else {
                Text("You decided to refocus on")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.subheadline)
                    .padding(10)
                Text("\(self.viewModel.getRefocus()?.title ?? "") ")
                    .foregroundColor(.gray)
                    .padding(20)
                    .multilineTextAlignment(.center)
            }
        }
        Spacer()
        VStack {
            if (!self.viewModel.isArchived()) {
                HStack {
                    Button(action: {
                        self.viewModel.archive()
                        let result = self.controller.update(viewModel: self.viewModel)
                        
                        if (result != nil) {
                            NotificationCenter.default.post(
                                Notification.init(name: Notification.Name(rawValue: "RefreshWorryListNotifciation"))
                            )
                            self.presentation.wrappedValue.dismiss()
                        }
                        else {
                            self.operationFailed = true
                        }
                    }) {
                        HStack {
                            Image(systemName: "archivebox")
                                .font(.title2)
                            Text("Archive")
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
            
            HStack {
                Button(action: {
                    self.confirmDeletion.toggle()
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .font(.title2)
                        Text("Delete")
                            .fontWeight(.semibold)
                            .font(.title2)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(colorHelper.secondaryColorDark)
                    .cornerRadius(50)
                    .padding(10)
                }
                .alert(isPresented: self.$confirmDeletion) {
                    Alert(
                        title: Text("Wait..."),
                        message: Text("Just checking - are you sure you wish to delete this worry?"),
                        primaryButton: .destructive(Text("I'm sure")) {
                            let result = self.controller.delete(id: self.viewModel.getRecordId() ?? 0)
                            
                            if (result) {
                                NotificationCenter.default.post(
                                    Notification.init(name: Notification.Name(rawValue: "RefreshWorryListNotifciation"))
                                )
                                self.presentation.wrappedValue.dismiss()
                            }
                        },
                        secondaryButton: .cancel(Text("No, don\'t!"))
                    )
                }
            }
            
        }
    }
}

