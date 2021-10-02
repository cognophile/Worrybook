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
        let tabDescriptor = (self.selection == 0) ? "diary" : "archive"

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
                .modifier(EmptyDataModifier(
                    items: filteredEntries,
                    placeholder:
                            VStack {
                                Image(systemName: "questionmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(self.colorHelper.getTextColor())
                                    .padding(.bottom, 10)
                                Text("Your \(tabDescriptor) is empty!")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .padding(.bottom, 20)
                                    .foregroundColor(self.colorHelper.getTextColor())
                                Text("We've all got something to be thankful for.\n Use the button below to add an entry each day!")
                                    .font(.body)
                                    .foregroundColor(self.colorHelper.getTextColor())
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                            }
                            .padding([.top], 20)
                            .padding([.bottom], 50)
                            .padding([.leading, .trailing], 10)
                ))
            }
        }
        .onAppear(perform: populate)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "DiaryEntryRefreshNotification"))) { _ in
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
