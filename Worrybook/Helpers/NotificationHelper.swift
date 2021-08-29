//
//  NotificationHelper.swift
//  Worrybook
//
//  Created by Alex Boggis on 22/08/2021.
//

import Foundation
import UserNotifications

class NotificationHelper {
    private var uniqueId: String?
    
    init() {}
    
    public func getUniqueId() -> String? {
        return self.uniqueId ?? nil
    }
    
    public func setUniqueId(uniqueId: String) {
        self.uniqueId = uniqueId
    }
    
    public func scheduleRepeatingNotification(title: String, message: String, hour: Int, minute: Int) -> Bool {
        var success = true
        let uniqueId = UUID().uuidString
        
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: title, arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: message, arguments: nil)
        content.sound = UNNotificationSound.default
        content.badge = 0
        
        // Set scheduled time
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
        
        self.uniqueId = uniqueId
        return success
    }
    
    public func hasPendingNotification(completion: @escaping (Bool) -> Void) {
        var pending = false
        let center = UNUserNotificationCenter.current()
        
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                if (request.identifier == self.uniqueId) {
                    pending = true
                }
            }
            
            completion(pending)
        })
    }
    
    public func getPendingNotificationTriggerTime(completion: @escaping (Int, Int) -> Void) {
        var triggerDate = Date()
        
        let center = UNUserNotificationCenter.current()
        center.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                if (request.identifier == self.uniqueId) {
                    let calendarTrigger = request.trigger as! UNCalendarNotificationTrigger
                    triggerDate = calendarTrigger.nextTriggerDate()!
                }
            }
            
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: triggerDate)
            let minute = calendar.component(.minute, from: triggerDate)

            completion(hour, minute)
        })
    }
    
    public func removeRepeatingNotification(completionHandler: @escaping (Bool) -> Void) {
        var removed = false
        let center = UNUserNotificationCenter.current()
        
        if let uniqueId = self.getUniqueId() {
            center.getPendingNotificationRequests(completionHandler: { requests in
                for request in requests {
                    if (request.identifier == uniqueId) {
                        center.removePendingNotificationRequests(withIdentifiers: [uniqueId])
                        removed = true
                    }
                }

                completionHandler(removed)
            })
        }
        else {
            completionHandler(removed)
        }
    }
    
    public static func areNotificationsGranted(completionHandler: @escaping (Bool) -> Void) {
        var granted = false
        let center = UNUserNotificationCenter.current()
        
        center.getNotificationSettings { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
                case .notDetermined:
                    granted = false
                case .authorized:
                    granted = true
                case .denied:
                    granted = false
                case .provisional:
                    granted = false
                case .ephemeral:
                    granted = false
                @unknown default:
                    granted = false
            }

            completionHandler(granted)
        }
    }
}
