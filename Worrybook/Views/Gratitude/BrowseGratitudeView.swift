//
//  ManageGratitudeDiaryView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseGratitudeDiaryView: View {
    @Binding var show: Bool
    
    @State var selection = 0
    @State var entries: [GratitudeDiaryEntryViewModel] = []
    
    var controller = GratitudeDiaryController()
    public let tabs: [String] = ["Unarchived", "Archived"]
    private let colorHelper = ColorHelper()
    
    private func populate() {
        self.entries = controller.getAll()
    }
    
    var body: some View {
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
                List(filteredEntries) { viewModel in
                    GratitudeDiaryListRow(entry: viewModel)
                }
            }
        }
        .onAppear(perform: populate)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "DiaryEntryRefreshNotifciation"))) { _ in
            populate()
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
