//
//  ManageGratitudeDiaryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseGratitudeDiaryView: View {
    @Binding var show: Bool

    var controller = GratitudeDiaryController()
    private let colorHelper = ColorHelper()
        
    var body: some View {
        let entries = controller.getAll()

        HStack {
            return List(entries, id: \.id) { entry in
                GratitudeDiaryListRow(entry: entry)
            }
        }
        
        Spacer()
        HStack {
            NavigationLink(destination: CreateGratitudeDiaryEntryView()) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2)
                    Text("Write an entry")
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
