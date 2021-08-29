//
//  SettingsController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class SettingsController {
    var repository: SettingsRepository?
    
    init() {
        self.repository = SettingsRepository()
    }
    
    public func getAllSettings() -> [SettingViewModel]? {
        let entities = repository?.getAll()
        
        if (entities != nil) {
            return SettingsTranslationService.translateMultiple(rows: entities!)
        }
        
        return nil
    }
    
    public func save(settings: Dictionary<String, Any>) -> Bool {
        if (!settings.isEmpty) {
            let time: (Int, Int) = settings["WorryTimeNotificationSchedule"] as! (Int, Int)
            let worryTimeNotificationScheduled = self.scheduleWorryNotification(hour: time.0, minute: time.1)
            
            return worryTimeNotificationScheduled
        }
        
        return false
    }
    
    public func getWorryTimeNotificationState() -> (Bool, Int, Int) {
        var scheduled = false
        var scheduledHour = 0
        var scheduledMinute = 0
        let notificationHelper = NotificationHelper()
        
        if let notification = self.getWorryTimeNotificationRecord() {
            if let guid = notification.getGuid() {
                notificationHelper.setUniqueId(uniqueId: guid)
                
                let group = DispatchGroup()
                group.enter()
                notificationHelper.hasPendingNotification() { pending in
                    scheduled = pending
                    group.leave()
                }
                
                group.enter()
                notificationHelper.getPendingNotificationTriggerTime() { hour, minute in
                    scheduledHour = hour
                    scheduledMinute = minute
                    group.leave()
                }
                
                group.wait()
            }
        }
        
        return (scheduled, scheduledHour, scheduledMinute)
    }
    
    public func removeWorryTimeNotification() -> Bool
    {
        var notificationRemoved = false
        let notificationHelper = NotificationHelper()
        let semaphore = DispatchSemaphore(value: 0)

        if let notification = self.getWorryTimeNotificationRecord() {
            if let guid = notification.getGuid() {
                notificationHelper.setUniqueId(uniqueId: guid)
                notificationHelper.removeRepeatingNotification() { removed in
                    notificationRemoved = removed
                    semaphore.signal()
                }
            }
            
            
            semaphore.wait()
            _ = self.deleteSettingsRecord(id: notification.getId()!)
        }

        return notificationRemoved
    }
    
    public func deleteSettingsRecord(id: Int) -> Bool {
        if (id > 0) {
            let entity = self.repository?.delete(id: id)
            
            if (entity != nil) {
                return true
            }
        }
        
        return false
    }
    
    private func scheduleWorryNotification(hour: Int, minute: Int) -> Bool {
        var existingNotification = false
        let notificationHelper = NotificationHelper()
        
        let semaphore = DispatchSemaphore(value: 0)
        notificationHelper.hasPendingNotification() { pending in
            existingNotification = pending
            semaphore.signal()
        }
        
        semaphore.wait()
        
        if (!existingNotification) {
            let scheduled = notificationHelper.scheduleRepeatingNotification(
                title: "It's Worry Time",
                message: "Time to take a moment to reflect and offload",
                hour: hour,
                minute: minute
            )
            
            guard let uniqueId = notificationHelper.getUniqueId() else {
                return false
            }
            
            if (scheduled && !uniqueId.isEmpty) {
                let setting: SettingViewModel = SettingViewModel()
                setting.setType(type: SettingTypeViewModel.worryTimeNotification)
                setting.setTitle(title: "Worry Time Notification")
                setting.setDescription(description: "Records the current notification center ID for the repeating notification: @\(hour):\(minute)")
                setting.setGuid(guid: uniqueId)
                
                _ = repository?.create(viewModel: setting)
            }

            return scheduled
        }
        
        return false
    }
    
    private func getWorryTimeNotificationRecord() -> SettingViewModel? {
        guard let viewModels = getAllSettings() else {
            return nil
        }

        if (!viewModels.isEmpty) {
            guard let notification = viewModels.first(where: { $0.type == SettingTypeViewModel.worryTimeNotification }) else {
                return nil
            }
            
            return notification
        }
        
        return nil
    }
}
