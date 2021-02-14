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
                        .frame(width: 50, height: 60)
                        .foregroundColor(.white)
                    }
                    .padding(.trailing, 348)
                    
                    Spacer()
                    HStack {
                        Image("Worrybook_title_colour_large")
                            .resizable()
                            .frame(width: 300, height: 100)
                            .padding(10)
                    }
                    Spacer()
                    Image("Worrybook_icon_colour_xl")
                        .resizable()
                        .frame(width: 150, height: 150)
                    Spacer()
                    HStack {
                        Text("Time heals all wounds\n")
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
                        .padding(10)
                    }
                    .sheet(isPresented: self.$showCreateModal, content: {
                        NavigationView {
                            CreateWorryView(showCreateModal: self.$showCreateModal)
                                .navigationBarTitle("What's up?")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showCreateModal.toggle()
                                    }) {
                                        HStack {
                                            Image(systemName: "xmark")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                                .background(
                                                    Circle()
                                                        .frame(width: 32, height: 32)
                                                )
                                        }
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(colorHelper.secondaryColor)
                                        .padding(.top, 10)
                                        .padding(.leading, 348)
                                        .padding(.trailing, 10)
                                        .cornerRadius(3.0)
                                    })
                        }
                        
                    })
                    
                    Button(action: {
                        self.showReadModal.toggle()
                    }) {
                        HStack {
                            Image(systemName: "book")
                                .font(.title2)
                            Text("Past worries")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .cornerRadius(50)
                        .padding(10)
                    }
                    .sheet(isPresented: self.$showReadModal, content: {
                        NavigationView {
                            BrowseWorryView(showReadModal: self.$showReadModal)
                                .navigationBarTitle("Past worries")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showReadModal.toggle()
                                    }) {
                                        HStack {
                                            Image(systemName: "xmark")
                                                .font(.title2)
                                                .foregroundColor(.gray)
                                                .background(
                                                    Circle()
                                                        .frame(width: 32, height: 32)
                                                )
                                        }
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(colorHelper.secondaryColor)
                                        .padding(.top, 10)
                                        .padding(.leading, 348)
                                        .padding(.trailing, 10)
                                        .cornerRadius(3.0)
                                    }
                                )
                        }
                    })
                }
                .navigationBarHidden(true)
            }
        }
    }
}
