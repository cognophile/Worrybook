//
//  DetailWorryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI
import Foundation

struct DetailWorryView: View {
    @Environment(\.presentationMode) var presentation
        
    @State private var operationFailed = false
    @State private var confirmDeletion = false
    
    private let colorHelper = ColorHelper()

    public var controller = WorryController()
    var viewModel: WorryViewModel

    var body: some View {
        VStack {
            ScrollView {
                Group {
                    HStack {
                        Text("\(self.viewModel.getTitle())")
                            .fontWeight(.bold)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.title2)
                    }
                    
                    HStack {
                        Text("\(self.viewModel.getCreatedDate())")
                            .fontWeight(.regular)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.caption)
                            .padding(2)
                    }
                    
                    HStack {
                        Text("\(self.viewModel.getTypeString())")
                            .font(.caption)
                            .padding(7.5)
                            .foregroundColor(.white)
                            .background(self.viewModel.getTypeColour())
                            .cornerRadius(50)
                            .padding(10)
                    }
                }
                
                Divider()
                    .padding([.leading, .trailing], 10)
                
                Group {
                    Text("\(self.viewModel.getDescription())")
                        .foregroundColor(colorHelper.getTextColor())
                        .multilineTextAlignment(.center)
                        .padding([.top, .bottom], 30)
                        .padding([.leading, .trailing], 10)
                    
                    if (self.viewModel.getType() == WorryTypeViewModel.practical) {
                        Text("Your plan")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.headline)
                            .padding(5)
                        Text("\(self.viewModel.getSolution() ?? "")")
                            .foregroundColor(colorHelper.getTextColor())
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 10)
                    }
                }
                
                Group {
                    HStack {
                        HStack {
                            Text("Category")
                                .fontWeight(.bold)
                            Text("\(self.viewModel.getCategory()?.title ?? "") ")
                        }
                        .font(.caption)
                        .padding(7.5)
                        .foregroundColor(.white)
                        .background(ColorHelper.getColor(r: 51, g: 92, b: 129))
                        .cornerRadius(50)
                        
                        if (self.viewModel.getType() != WorryTypeViewModel.practical) {
                            HStack {
                                Text("Refocus")
                                    .fontWeight(.bold)
                                Text("\(self.viewModel.getRefocus()?.title ?? "") ")
                            }
                            .font(.caption)
                            .padding(7.5)
                            .foregroundColor(.white)
                            .background(ColorHelper.getColor(r: 51, g: 92, b: 129))
                            .cornerRadius(50)
                        }
                    }.padding(35)
                }
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
                                Notification.init(name: Notification.Name(rawValue: "RefreshWorryListNotification"))
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
                        .padding(5)
                    }
                    .alert(isPresented: self.$operationFailed) {
                        Alert(
                            title: Text("Oops!"),
                            message: Text("Looks like something went wrong - sorry about that :( \n\nPlease try again. If you continue to encounter issues, please report the issue via the website."),
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
                    .padding(5)
                }
                .alert(isPresented: self.$confirmDeletion) {
                    Alert(
                        title: Text("Wait..."),
                        message: Text("Just checking - are you sure you wish to delete this worry?"),
                        primaryButton: .destructive(Text("I'm sure")) {
                            let result = self.controller.delete(id: self.viewModel.getId() ?? 0)
                            
                            if (result) {
                                NotificationCenter.default.post(
                                    Notification.init(name: Notification.Name(rawValue: "RefreshWorryListNotification"))
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

