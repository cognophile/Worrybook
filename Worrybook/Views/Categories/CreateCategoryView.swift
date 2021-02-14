//
//  CreateCategoryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct CreateCategoryView: View {
    let colorHelper = ColorHelper()
    
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Categorise your worries")
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
            
        Spacer()
            
        Button(action: {
            
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
    }
}
