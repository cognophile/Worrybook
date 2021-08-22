//
//  SettingsController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class SettingsController {
    init() {
        
    }
    
    public func save(settings: Dictionary<String, Any>) -> Bool {
        let time: (Int, Int) = settings["WorryTimeNotificationSchedule"] as! (Int, Int)
        let worryTimeNotificationScheduled = scheduleWorryNotification(hour: time.0, minute: time.1)
        
        return worryTimeNotificationScheduled
    }
    
    public func getWorryTimeNotificationState() -> Bool {
        // retrieve scheduled worry time id (from db), hour and minute (notification center?)
        return true
    }
    
    private func scheduleWorryNotification(hour: Int, minute: Int) -> Bool {
        var scheduled = false
        // check for notification scheduled already
        //  if so and time has changed, update
        //  else fail and alert user
        
        let (success, uniqueId) = NotificationHelper.scheduleRepeatingNotification(title: "Hey, it's your Worry Time 💙",
                                                         message: "Take a moment to reflect and offload.",
                                                         hour: hour,
                                                         minute: minute)
        scheduled = success
        // save id to db
        return scheduled
    }
}
