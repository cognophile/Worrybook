//
//  BrowseTechniquesView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI
import PartialSheet

struct BrowseTechniquesView: View {
    @Binding var show: Bool
    
    @Environment(\.presentationMode) var presentation

    @State private var techniques: [TechniqueViewModel]
    @State private var confirmDeletion = false
    @State private var technique: TechniqueViewModel = TechniqueViewModel(title: nil, description: nil)
    
    var controller = TechniquesController()
    private let colorHelper = ColorHelper()
        
    let sheetManager: PartialSheetManager = PartialSheetManager()

    init(show: Binding<Bool>) {
        self._show = show
        self._techniques = .init(initialValue: [TechniqueViewModel]())
    }
    
    private func populate() {
        self.techniques = controller.getAll()
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { i in
            self.technique.setId(id: self.techniques[i].getId()!)
        }

        self.confirmDeletion.toggle()
    }
    
    var body: some View {
        VStack {
            HStack {
                List {
                    ForEach(self.techniques) { t in
                        TechniqueListRow(technique: t)
                    }
                    .onDelete(perform: self.delete)
                }
                .modifier(EmptyDataModifier(
                    items: self.techniques,
                    placeholder:
                            VStack {
                                Image(systemName: "questionmark.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(self.colorHelper.getTextColor())
                                    .padding(.bottom, 10)
                                Text("No techniques found!")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                                    .padding(.bottom, 20)
                                    .foregroundColor(self.colorHelper.getTextColor())
                                Text("Got a useful technique? You can add one below!")
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
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshTechniqueListNotification"))) { _ in
                populate()
            }
            .onAppear(perform: self.populate)
            .alert(isPresented: self.$confirmDeletion) {
                Alert(
                    title: Text("Wait..."),
                    message: Text("Just checking - are you sure you wish to delete this technique?"),
                    primaryButton: .destructive(Text("I'm sure")) {
                        let result = self.controller.delete(id: self.technique.getId() ?? 0)
                        
                        if (result) {
                            NotificationCenter.default.post(
                                Notification.init(name: Notification.Name(rawValue: "RefreshTechniqueListNotification"))
                            )
                            self.presentation.wrappedValue.dismiss()
                        }
                    },
                    secondaryButton: .cancel(Text("No, don\'t!"))
                )
            }
            
            Spacer()
            HStack {
                NavigationLink(destination: CreateTechniqueView()) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title2)
                        Text("Add a technique")
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
        .addPartialSheet()
        .environmentObject(self.sheetManager)
    }
}


