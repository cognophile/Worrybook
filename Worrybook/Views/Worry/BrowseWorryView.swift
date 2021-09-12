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
    @State var worries: [WorryViewModel] = []
    
    public var controller = WorryController()
    public let tabs: [String] = ["Unarchived", "Archived"]
    
    private func populate() {
        self.worries = controller.getAll()
    }
    
    var body: some View {
        let chosenTab = (self.selection == 0) ? false : true
        let filteredEntries = worries.filter({$0.archived == chosenTab})
        
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
                List(filteredEntries) { viewModel in
                    WorryListRow(worry: viewModel)
                }
            }
        }
        .onAppear(perform: populate)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshWorryListNotification"))) { _ in
            populate()
        }
    }
}
