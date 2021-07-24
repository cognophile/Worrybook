//
//  BrowseTechniquesView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseTechniquesView: View {
    var controller = TechniquesController()
    private let colorHelper = ColorHelper()
    @State private var deleteIndex: Int? = nil
    
    @Binding var show: Bool
    @Environment(\.presentationMode) var presentation

    @State private var techniques: [TechniqueViewModel]
    @State private var confirmDeletion = false
    @State private var technique: TechniqueViewModel = TechniqueViewModel(title: nil, description: nil)
    
    init(show: Binding<Bool>) {
        self._show = show
        self._techniques = .init(initialValue: controller.getAll())
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
        HStack {
            List {
                ForEach(self.techniques) { t in
                    TechniqueListRow(technique: t)
                }
                .onDelete(perform: delete)
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshTechniqueListNotification"))) { _ in
                populate()
            }
        }
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
}


