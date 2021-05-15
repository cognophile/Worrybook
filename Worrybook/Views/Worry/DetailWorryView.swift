//
//  DetailWorryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct DetailWorryView: View {
    @Environment(\.presentationMode) var presentation
    
    private let colorHelper = ColorHelper()
    
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
            HStack {
                
            Button(action: {
                // @todo: This will work once the controller wiring is there to archive, and reload the browse view when we go back.
                self.viewModel.archive()
                self.presentation.wrappedValue.dismiss()
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
            }
            HStack {
                Button(action: {
                    
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
            }
            
        }
    }
}
