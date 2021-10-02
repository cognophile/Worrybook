//
//  CreateGratitudeDiaryEntryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CreateGratitudeDiaryEntryView: View {
    let colorHelper = ColorHelper()
    var entry: GratitudeDiaryEntryViewModel = GratitudeDiaryEntryViewModel()
    let controller: GratitudeDiaryController = GratitudeDiaryController()
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var itemOne: String = ""
    @State private var itemTwo: String = ""
    @State private var itemThree: String = ""
    @State private var operationFailed = false
    @State private var invalidFields = false
    @State private var createdModel: GratitudeDiaryEntryViewModel = GratitudeDiaryEntryViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                Group {
                    VStack {
                        Text("What are you thankful for?")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.title)
                            .padding(10)
                        
                        Text("Take a moment to consider three things you're grateful for. A gratuity diary is most effective when the entries are personal, specific, and detailed.")
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.body)
                            .padding(10)
                    }
                    
                    VStack {
                        HStack {
                            Text("First")
                                .fontWeight(.medium)
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.subheadline)
                                .padding(5)
                        }
                        
                        HStack {
                            TextEditor(text: self.$itemOne)
                                .frame(minHeight: 50, maxHeight: 50)
                                .foregroundColor(.gray)
                                .background(Color(UIColor.systemBackground))
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(colorHelper.secondaryColor, lineWidth: 1)
                                )
                                .padding(10)
                        }
                        
                        HStack {
                            Text("Second")
                                .fontWeight(.medium)
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.subheadline)
                                .padding(5)
                        }
                        
                        HStack {
                            TextEditor(text: self.$itemTwo)
                                .frame(minHeight: 50, maxHeight: 50)
                                .foregroundColor(.gray)
                                .background(Color(UIColor.systemBackground))
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(colorHelper.secondaryColor, lineWidth: 1)
                                )
                                .padding(10)
                        }
                        
                        HStack {
                            Text("Third")
                                .fontWeight(.medium)
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.subheadline)
                                .padding(5)
                        }
                        
                        HStack {
                            TextEditor(text: self.$itemThree)
                                .frame(minHeight: 50, maxHeight: 50)
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
                }
            }
            
            Spacer()
            Button(action: {
                if (!self.itemOne.isEmpty && !self.itemTwo.isEmpty && !self.itemThree.isEmpty) {
                    self.entry.firstItem = self.itemOne
                    self.entry.secondItem = self.itemTwo
                    self.entry.thirdItem = self.itemThree
                    self.entry.created = Date()
                    
                    self.createdModel = controller.create(viewModel: self.entry)
                    
                    if (self.createdModel.id != nil) {
                        self.presentationMode.wrappedValue.dismiss()
                        NotificationCenter.default.post(
                            Notification.init(name: Notification.Name(rawValue: "DiaryEntryRefreshNotification"))
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
                    Text("Create")
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
                    message: Text("You need to enter three items to proceed"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
            
        }
    }
}
