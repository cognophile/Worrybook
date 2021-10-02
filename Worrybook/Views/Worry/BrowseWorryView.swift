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
    public let colorHelper = ColorHelper()

    private func populate() {
        self.worries = controller.getAll()
    }
    
    var body: some View {
        let chosenTab = (self.selection == 0) ? false : true
        let filteredEntries = worries.filter({$0.archived == chosenTab})
        let tabDescriptor = (self.selection == 0) ? "Worrybook" : "archive"
    
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
                                Text("It'll be here should you need it.\nYou can add an entry from the home screen.")
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
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshWorryListNotification"))) { _ in
            populate()
        }
    }
}
