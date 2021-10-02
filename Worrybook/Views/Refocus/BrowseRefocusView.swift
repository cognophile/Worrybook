//
//  BrowseRefocusView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct BrowseRefocusView: View {
    @Binding var show: Bool
    
    @Environment(\.presentationMode) var presentation
    
    @State private var refocuses: [RefocusViewModel]
    @State private var confirmDeletion = false
    @State private var refocus: RefocusViewModel = RefocusViewModel(title: nil)

    let controller = RefocusController()
    private let colorHelper = ColorHelper()
    
    init(show: Binding<Bool>) {
        self._show = show
        self._refocuses = .init(initialValue: [RefocusViewModel]())
    }
    
    private func populate() {
        self.refocuses = self.controller.getAll()
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { i in
            self.refocus.setId(id: self.refocuses[i].getId()!)
        }

        self.confirmDeletion.toggle()
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(self.refocuses, id: \.uuid) { refocus in
                    RefocusListRow(refocus: refocus)
                }
                .onDelete(perform: self.delete)
            }
        }
        .onAppear(perform: self.populate)
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "RefreshRefocusListNotification"))) { _ in
            self.populate()
        }
        .alert(isPresented: self.$confirmDeletion) {
            Alert(
                title: Text("Wait..."),
                message: Text("Just checking - are you sure you wish to delete this refocus method?"),
                primaryButton: .destructive(Text("I'm sure")) {
                    let result = self.controller.delete(id: self.refocus.getId() ?? 0)
                    
                    if (result) {
                        NotificationCenter.default.post(
                            Notification.init(name: Notification.Name(rawValue: "RefreshRefocusListNotification"))
                        )
                        self.presentation.wrappedValue.dismiss()
                    }
                },
                secondaryButton: .cancel(Text("No, don\'t!"))
            )
        }
        
        Spacer()
        HStack {
            NavigationLink(destination: CreateRefocusView()) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2)
                    Text("Add a method")
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
