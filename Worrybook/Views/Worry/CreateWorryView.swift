//
//  AddWorryView.swift
//  WorryBook
//
//  Created by cognophile
//

import SwiftUI

struct CreateWorryView: View {
    @Binding var showCreateModal: Bool
    
    @State private var nextStageActive = false
    @State private var showWorryTypeAlert = false
    @State private var invalidFields = false
    @State private var isPracticalWorry = false
    @State private var validationMessage = ""
    @State private var viewModel: WorryViewModel = WorryViewModel()
    
    private let colorHelper = ColorHelper()
    private let controller = WorryController()

    var body: some View {
            VStack {
                ScrollView {
                    VStack {
                        Group {
                            VStack {
                                HStack {
                                    Text("Give it a title")
                                        .fontWeight(.medium)
                                        .foregroundColor(colorHelper.getTextColor())
                                        .font(.headline)
                                        .padding(10)
                                }
                                
                                HStack {
                                    TextField("", text: self.$viewModel.title)
                                        .frame(minHeight: 50)
                                        .foregroundColor(colorHelper.getTextColor())
                                        .background(Color(UIColor.systemBackground))
                                        .textFieldStyle(RoundedCornerBorderTextFieldExtension())
                                        .padding(10)
                                }
                                
                                VStack {
                                    Text("Describe how you feel")
                                        .fontWeight(.medium)
                                        .foregroundColor(colorHelper.getTextColor())
                                        .font(.headline)
                                        .padding(10)

                                    TextEditor(text: self.$viewModel.description)
                                        .frame(minHeight: 50, maxHeight: 50)
                                        .foregroundColor(colorHelper.getTextColor())
                                        .background(Color(UIColor.systemBackground))
                                        .padding(10)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(colorHelper.secondaryColor, lineWidth: 1)
                                        )
                                        .padding(10)
                                    
                                    HStack {
                                        Text("Can you solve it?")
                                            .foregroundColor(colorHelper.getTextColor())
                                            .padding(10)
                                        Toggle(isOn: self.$isPracticalWorry) {
                                            Button(action: {
                                                self.showWorryTypeAlert.toggle()
                                            }) {
                                                VStack (alignment: HorizontalAlignment.center) {
                                                    Image(systemName: "questionmark.circle")
                                                        .foregroundColor(colorHelper.getTextColor())
                                                        .imageScale(.small)
                                                }
                                            }
                                            .alert(isPresented: self.$showWorryTypeAlert) {
                                                Alert(
                                                    title: Text("What does this mean?"),
                                                    message: Text("A worry is practical if you can do something now to resolve it. \nIf not, or if it's a \"what if\" worry, then it's hypothetical"),
                                                    dismissButton: .default(Text("Got it!"))
                                                )
                                            }
                                        }
                                        .padding(10)
                                    }
                                    
                                    if (self.isPracticalWorry) {
                                        Text("What's your plan?")
                                            .fontWeight(.medium)
                                            .foregroundColor(colorHelper.getTextColor())
                                            .font(.headline)
                                            .padding(10)

                                        TextEditor(text: self.$viewModel.solution ?? "")
                                            .frame(minHeight: 50, maxHeight: 50)
                                            .foregroundColor(colorHelper.getTextColor())
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
                    }
                }
                        
                Spacer()
                Group {
                    VStack {
                        Button(action: {
                            let worryType = (self.isPracticalWorry) ? WorryTypeViewModel.practical : WorryTypeViewModel.hypothetical
                            self.validationMessage = (self.isPracticalWorry)
                                ? "You need to enter a title, description, and plan to proceed"
                                : "You need to enter a title and description to proceed"
                            
                            self.viewModel.setType(type: worryType)
                            if (self.viewModel.hasRequiredFields()) {
                                self.nextStageActive = true
                            }
                            else {
                                self.invalidFields = true
                            }
                        }) {
                            HStack {
                                Text("Next")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                Image(systemName: "chevron.right")
                                    .font(.title2)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(colorHelper.primaryColor)
                            .cornerRadius(50)
                            .padding(10)
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
            
            
                NavigationLink (destination: WorryCategorisationAndRefocusView(viewModel: self.viewModel)
                    .navigationBarTitle("Categorise\(!self.isPracticalWorry ? " & Refocus" : "")")
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.showCreateModal.toggle()
                        }) {
                            HStack {
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .foregroundColor(.gray)
                                    .background(
                                        Circle().frame(width: 32, height: 32),
                                        alignment: .center
                                    )
                            }
                            .frame(width: .infinity, height: 50)
                            .padding(5)
                            .foregroundColor(colorHelper.secondaryColor)
                            .cornerRadius(3.0)
                        }), isActive: self.$nextStageActive)
                {
                    EmptyView()
                }
        }
    }
}
