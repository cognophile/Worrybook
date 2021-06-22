//
//  MenuContentView.swift
//  Worrybook
//
//  Created by cognophile
//

import SwiftUI

struct MenuContentView: View {
    @State private var showGratitudeManager = false
    @State private var showRefocusingList = false
    @State private var showCategoriesList = false
    @State private var showTechniquesList = false
    @State private var showAboutView = false
    @State private var showSettings = false

    private let colorHelper = ColorHelper()

    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                HStack{
                    Image("Worrybook_transparent_title_banner")
                        .resizable()
                        .frame(width: 265, height: 265)
                }
                
                // Gratitude Diary
                HStack {
                    Button(action: {
                        self.showGratitudeManager.toggle()
                    }) {
                        VStack (alignment: HorizontalAlignment.center) {
                            Image(systemName: "heart")
                                .foregroundColor(colorHelper.getTextColor())
                                .imageScale(.large)
                        }
                        VStack (alignment: HorizontalAlignment.leading) {
                            Text("Gratitude")
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.headline)
                        }
                        .padding(.leading, 6)
                    }
                    .sheet(isPresented: self.$showGratitudeManager, content: {
                        NavigationView {
                            BrowseGratitudeDiaryView(show: self.$showGratitudeManager)
                                .navigationBarTitle("Gratitude Diary")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showGratitudeManager.toggle()
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
                .padding(.top, 1)
                .padding(.leading, 10)
                
                // Refocusing methods
//                HStack {
//                    Button(action: {
//                        self.showRefocusingList.toggle()
//                    }) {
//                        VStack (alignment: HorizontalAlignment.center) {
//                            Image(systemName: "hand.raised")
//                                .foregroundColor(colorHelper.getTextColor())
//                                .imageScale(.large)
//                        }
//                        VStack (alignment: HorizontalAlignment.leading) {
//                            Text("Refocusing")
//                                .foregroundColor(colorHelper.getTextColor())
//                                .font(.headline)
//                        }
//                        .padding(.leading, 7)
//
//                    }
//                    .sheet(isPresented: self.$showRefocusingList, content: {
//                        NavigationView {
//                            BrowseRefocusView(show: self.$showRefocusingList)
//                                .navigationBarTitle("Refocusing Methods")
//                                .navigationBarItems(leading:
//                                    Button(action: {
//                                        self.showRefocusingList.toggle()
//                                    }) {
//                                        HStack {
//                                            Image(systemName: "xmark")
//                                                .font(.title2)
//                                                .foregroundColor(.gray)
//                                                .background(
//                                                    Circle()
//                                                        .frame(width: 32, height: 32)
//                                                )
//                                        }
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(colorHelper.secondaryColor)
//                                        .padding(.top, 10)
//                                        .padding(.leading, 348)
//                                        .padding(.trailing, 10)
//                                        .cornerRadius(3.0)
//                                    }
//                                )
//                        }
//                    })
//                }
//                .padding(.top, 5)
//                .padding(.leading, 10)
                
                // Categories
//                HStack {
//                    Button(action: {
//                        self.showCategoriesList.toggle()
//                    }) {
//                        VStack (alignment: HorizontalAlignment.center) {
//                            Image(systemName: "tag")
//                                .foregroundColor(colorHelper.getTextColor())
//                                .imageScale(.large)
//                        }
//                        VStack (alignment: HorizontalAlignment.leading) {
//                            Text("Categories")
//                                .foregroundColor(colorHelper.getTextColor())
//                                .font(.headline)
//                        }
//                        .padding(.leading, 5)
//
//                    }
//                    .sheet(isPresented: self.$showCategoriesList, content: {
//                        NavigationView {
//                            BrowseCategoriesView(show: self.$showCategoriesList)
//                                .navigationBarTitle("Worry Categories")
//                                .navigationBarItems(leading:
//                                    Button(action: {
//                                        self.showCategoriesList.toggle()
//                                    }) {
//                                        HStack {
//                                            Image(systemName: "xmark")
//                                                .font(.title2)
//                                                .foregroundColor(.gray)
//                                                .background(
//                                                    Circle()
//                                                        .frame(width: 32, height: 32)
//                                                )
//                                        }
//                                        .frame(width: 50, height: 50)
//                                        .foregroundColor(colorHelper.secondaryColor)
//                                        .padding(.top, 10)
//                                        .padding(.leading, 348)
//                                        .padding(.trailing, 10)
//                                        .cornerRadius(3.0)
//                                    }
//                                )
//                        }
//                    })
//                }
//                .padding(.top, 5)
//                .padding(.leading, 10)
                
                // Techniques
                HStack {
                    Button(action: {
                        self.showTechniquesList.toggle()
                    }) {
                        VStack (alignment: HorizontalAlignment.center) {
                            Image(systemName: "briefcase")
                                .foregroundColor(colorHelper.getTextColor())
                                .imageScale(.large)
                        }
                        VStack (alignment: HorizontalAlignment.leading) {
                            Text("Techniques")
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.headline)
                        }
                        .padding(.leading, 5)

                    }
                    .sheet(isPresented: self.$showTechniquesList, content: {
                        NavigationView {
                            BrowseTechniquesView(show: self.$showTechniquesList)
                                .navigationBarTitle("Worry Techniques")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showTechniquesList.toggle()
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
                .padding(.top, 5)
                .padding(.leading, 10)

                // About
                HStack {
                    Button(action: {
                        self.showAboutView.toggle()
                    }) {
                        VStack (alignment: HorizontalAlignment.center) {
                            Image(systemName: "info.circle")
                                .foregroundColor(colorHelper.getTextColor())
                                .imageScale(.large)
                        }
                        VStack (alignment: HorizontalAlignment.leading) {
                            Text("About")
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.headline)
                        }
                        .padding(.leading, 10)
                    }
                    .sheet(isPresented: self.$showAboutView, content: {
                        NavigationView {
                            AboutView(show: self.$showAboutView)
                                .navigationBarTitle("About Worrybook")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showAboutView.toggle()
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
                .padding(.top, 30)
                .padding(.leading, 10)
                
                // Settings
                HStack {
                    Button(action: {
                        self.showSettings.toggle()
                    }) {
                        VStack (alignment: HorizontalAlignment.center) {
                            Image(systemName: "gear")
                                .foregroundColor(colorHelper.getTextColor())
                                .imageScale(.large)
                        }
                        VStack (alignment: HorizontalAlignment.leading) {
                            Text("Settings")
                                .foregroundColor(colorHelper.getTextColor())
                                .font(.headline)
                        }
                        .padding(.leading, 5)

                    }
                    .sheet(isPresented: self.$showSettings, content: {
                        NavigationView {
                            SettingsView(show: self.$showSettings)
                                .navigationBarTitle("Settings")
                                .navigationBarItems(leading:
                                    Button(action: {
                                        self.showSettings.toggle()
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
                .padding(.top, 5)
                .padding(.leading, 10)
                
                Spacer()
                HStack {
                    Text("Made with ❤️ by cognophile")
                        .foregroundColor(colorHelper.getTextColor())
                        .font(.caption)
                        .padding(.bottom, 20)
                        .padding(.leading, 50)
                }

            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(colorHelper.getSchemeColour())
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
        }
    }
}
