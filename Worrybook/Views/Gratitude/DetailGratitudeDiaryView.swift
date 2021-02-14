//
//  DetailRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct DetailGratitudeDiaryView: View {
    @Environment(\.presentationMode) var presentation
    
    var entry: GratitudeDiaryEntry
    let colorHelper = ColorHelper()

    var body: some View {
        let items = self.entry.getItems()
        
        VStack {
            HStack {
                Text("\(entry.getTitle())")
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
