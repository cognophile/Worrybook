//
//  AppDelegate.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import UIKit
import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let center = UNUserNotificationCenter.current()
        
        // Delegate for UNUserNotificationCenterDelegate
        center.delegate = self
        
        // Permission for request alert, soud and badge
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // Enable or disable features based on authorization.
            if (granted){
                center.delegate = self
            }
        }
        return true
    }
}
