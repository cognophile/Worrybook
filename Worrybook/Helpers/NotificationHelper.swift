//
//  NotificationHelper.swift
//  Worrybook
//
//  Created by Alex Boggis on 22/08/2021.
//

import Foundation
import UserNotifications

struct NotificationHelper {
    public static func scheduleRepeatingNotification(title: String, message: String, hour: Int, minute: Int) -> (Bool, String) {
        var success = true
        let uniqueId = UUID().uuidString
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: message, arguments: nil)
        content.sound = UNNotificationSound.default
        
        // Receive with date
        var dateInfo = DateComponents()
        dateInfo.hour = hour
        dateInfo.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
        let request = UNNotificationRequest(identifier: uniqueId, content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()

        center.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
                success = false
            }
        }
        
        return (success, uniqueId)
    }
}
