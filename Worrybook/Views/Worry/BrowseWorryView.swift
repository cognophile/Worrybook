//
//  AddWorryView.swift
//  WorryBook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseWorryView: View {
    @Binding var showReadModal: Bool
    @State var selection = 0
    
    var controller = WorryController()
    let tabs: [String] = ["Unarchived", "Archived"]

    var body: some View {
        let entries = controller.getAll()
        
        let chosenTab = (self.selection == 0) ? false : true
        let filteredEntries = entries.filter({$0.archived == chosenTab})
        
        VStack {
            HStack{
                Picker(selection: $selection, label: Text("")) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        Text(self.tabs[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .padding(10)
            Spacer()
                        
            HStack {
                return List(filteredEntries) { worry in
                    WorryListRow(worry: worry)
                }
            }
        }
    }
}
