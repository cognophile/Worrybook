//
//  CreateGratitudeDiaryEntryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CreateGratitudeDiaryEntryView: View {
    let colorHelper = ColorHelper()
    
    @State private var title: String = ""
    @State private var itemOne: String = ""
    @State private var itemTwo: String = ""
    @State private var itemThree: String = ""
    
    var body: some View {
        VStack {
            Group {
                VStack {
                    HStack {
                        Text("What're you thankful for?")
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
                }
                
                VStack {
                    HStack {
                        Text("Firstly...")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.headline)
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
                        Text("Secondly...")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.headline)
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
                        Text("Lastly...")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.headline)
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
            Spacer()
            
            Button(action: {
                
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
        }
    }
}
