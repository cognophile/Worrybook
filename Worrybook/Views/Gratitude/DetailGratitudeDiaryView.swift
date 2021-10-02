//
//  DetailRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct DetailGratitudeDiaryView: View {
    @Environment(\.presentationMode) var presentation
    
    @State private var operationFailed = false
    @State private var confirmDeletion = false
    
    var controller = GratitudeDiaryController()
    var entry: GratitudeDiaryEntryViewModel
    let colorHelper = ColorHelper()

    var body: some View {
        let items = self.entry.getItems()
        
        VStack {
            HStack {
                Text("\(entry.getCreatedDate())")
                    .fontWeight(.medium)
                    .foregroundColor(colorHelper.getTextColor())
                    .font(.title3)
                    .padding(10)
            }
            
            Divider()
                .padding(10)
            
            Text("On this day you were grateful for...")
                .fontWeight(.medium)
                .foregroundColor(colorHelper.getTextColor())
                .font(.headline)
                .padding(10)
            
            ForEach(items, id: \.self) { item in
                HStack {
                    Text("\(item)")
                        .fontWeight(.regular)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.body)
                        .padding(10)
                }
            }
        }
        
        Spacer()
        VStack {
            if (!self.entry.isArchived()) {
                HStack {
                    Button(action: {
                        self.entry.archive()
                        let result = self.controller.update(viewModel: self.entry)
                        
                        if (result != nil) {
                            NotificationCenter.default.post(
                                Notification.init(name: Notification.Name(rawValue: "DiaryEntryRefreshNotification"))
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
                    .padding(10)
                }
                .alert(isPresented: self.$confirmDeletion) {
                    Alert(
                        title: Text("Wait..."),
                        message: Text("Just checking - are you sure you wish to delete this entry?"),
                        primaryButton: .destructive(Text("I'm sure")) {
                            let result = self.controller.delete(id: self.entry.getId() ?? 0)
                            
                            if (result) {
                                NotificationCenter.default.post(
                                    Notification.init(name: Notification.Name(rawValue: "DiaryEntryRefreshNotification"))
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
