//
//  ContentView.swift
//  WorryBook
//
//  Created by cognophile
//

import SwiftUI

struct HomeView: View {
    @State private var showCreateModal = false
    @State private var showReadModal = false
    @State private var showMenu: Bool = false
    
    private let colorHelper = ColorHelper()
    private let quote = QuoteHelper.getRandomQuote()

    private func openMenu() {
        self.showMenu.toggle()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 113 / 255, green: 173 / 255, blue: 174 / 255).edgesIgnoringSafeArea(.all)

                MenuView(width: 295,
                     isOpen: self.showMenu,
                     closeMenu: self.openMenu
                ).zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
                VStack {
                    Button(action: {
                        self.openMenu()
                    }) {
                        HStack {
                            Image(systemName: "text.justify")
                                .font(.title2)
                        }
                        .frame(maxWidth: .infinity,
                               maxHeight: 60,
                               alignment: .topLeading)
                        .foregroundColor(.white)
                        .padding(10)
                    }
                    
                    HStack {
                        Image("Worrybook_title_colour_large")
                            .resizable()
                            .frame(width: 300, height: 100)
                            .padding(5)
                    }
                    Spacer()
                    Image("Worrybook_icon_colour_xl")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                    HStack {
                        Text("\(self.quote)")
                            .fontWeight(.light)
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    Button(action: {
                        self.showCreateModal.toggle()
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .font(.title2)
                            Text("Write a worry")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(10)
                        .foregroundColor(.gray)
                        .background(Color.white)
                        .cornerRadius(50)
                        .padding(5)
                    }
                    .sheet(isPresented: self.$showCreateModal, content: {
                        NavigationView {
                            CreateWorryView(showCreateModal: self.$showCreateModal)
                                .navigationBarTitle("What's up?")
                                .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showCreateModal.toggle()
                                    }) {
                                        HStack {
                                            Image(systemName: "xmark")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                                .background(
                                                    Circle().frame(width: 32, height: 32),
                                                    alignment: .center
                                                )
                                        }
                                        .frame(width: .infinity, height: 50)
                                        .padding(5)
                                        .foregroundColor(colorHelper.secondaryColor)
                                        .cornerRadius(3.0)
                                    })
                        }
                    })
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name(rawValue: "WorrySavedNotification"))) { _ in
                        self.showCreateModal.toggle()
                    }
                    
                    Button(action: {
                        self.showReadModal.toggle()
                    }) {
                        HStack {
                            Image(systemName: "book")
                                .font(.title2)
                            Text("Worrybook")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(50)
                        .padding(5)
                    }
                    .sheet(isPresented: self.$showReadModal, content: {
                        NavigationView {
                            BrowseWorryView(showReadModal: self.$showReadModal)
                                .navigationBarTitle("Worrybook")
                                .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showReadModal.toggle()
                                    }) {
                                        HStack {
                                            Image(systemName: "xmark")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                                .background(
                                                    Circle().frame(width: 32, height: 32),
                                                    alignment: .center
                                                )
                                        }
                                        .frame(width: .infinity, height: 50)
                                        .padding(5)
                                        .foregroundColor(colorHelper.secondaryColor)
                                        .cornerRadius(3.0)
                                    }
                                )
                        }
                    })
                }
                .frame(width: UIScreen.main.bounds.width-10, alignment: .center)
                .navigationBarHidden(true)
            }
        }
    }
}
