//
//  WorryBookApp.swift
//  WorryBook
//
//  Created by cognophile
//

import SwiftUI
import Foundation

@main
struct WorrybookApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
