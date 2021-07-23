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
    @State private var isPracticalWorry = false
    @State private var viewModel: WorryViewModel = WorryViewModel()
    
    private let colorHelper = ColorHelper()
    private let controller = WorryController()

    var body: some View {
        VStack {
            Group {
                VStack{
                    TextField("Summary", text: self.$viewModel.title)
                        .frame(minHeight: 50)
                        .foregroundColor(.gray)
                        .background(Color(UIColor.systemBackground))
                        .textFieldStyle(RoundedCornerBorderTextFieldExtension())
                        .padding(10)
                }
                
                VStack {
                    HStack {
                        Text("Can you solve it?")
                            .foregroundColor(colorHelper.getTextColor())
                            .padding(10)
                        Toggle(isOn: self.$isPracticalWorry) {
                            Button(action: {
                                self.showWorryTypeAlert.toggle()
                            }) {
                                VStack (alignment: HorizontalAlignment.center) {
                                    Image(systemName: "info.circle")
                                        .foregroundColor(.gray)
                                        .imageScale(.small)
                                }
                            }
                            .alert(isPresented: self.$showWorryTypeAlert) {
                                Alert(
                                    title: Text("What's this mean?"),
                                    message: Text("A worry is practical if you can do something now to resolve it. \nIf not, or if it's a \"what if\" worry, then it's hypothetical"),
                                    dismissButton: .default(Text("Got it!"))
                                )
                            }
                        }
                        .padding(10)
                    }
                }
                
                VStack {
                    Text("Describe how you feel")
                        .fontWeight(.medium)
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.headline)
                        .padding(10)

                    TextEditor(text: self.$viewModel.description)
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
                
                if (self.isPracticalWorry) {
                    VStack {
                        Text("What's your plan?")
                            .fontWeight(.medium)
                            .foregroundColor(colorHelper.getTextColor())
                            .font(.headline)
                            .padding(10)

                        TextEditor(text: self.$viewModel.solution ?? "")
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
            }
            
            Spacer()
            Button(action: {
                let worryType = (self.isPracticalWorry) ? WorryTypeViewModel.practical : WorryTypeViewModel.hypothetical
                self.viewModel.setType(type: worryType)
                self.nextStageActive = true
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
            
            NavigationLink (destination: WorryCategorisationAndRefocusView(viewModel: self.viewModel)
                .navigationBarTitle("Categorise & Refocus")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                    Button(action: {
                        self.showCreateModal.toggle()
                    }) {
                        HStack {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .background(
                                    Circle()
                                        .frame(width: 32, height: 32)
                                )
                        }
                        .frame(width: 50, height: 50)
                        .foregroundColor(colorHelper.secondaryColor)
                        .padding(.top, 10)
                        .padding(.leading, 348)
                        .padding(.trailing, 10)
                        .cornerRadius(3.0)
                    }), isActive: self.$nextStageActive)
            {
                EmptyView()
            }
        }
    }
}
