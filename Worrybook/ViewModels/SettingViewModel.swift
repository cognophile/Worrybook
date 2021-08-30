//
//  SettingViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class SettingViewModel : Identifiable {
    public var id: Int? = nil
    public var uuid = UUID()
    public var type: SettingTypeViewModel?
    public var title: String = ""
    public var description: String = ""
    public var guid: String = ""
    public var created: Date = Date()
    
    init() {}
    
    public func setId(id: Int) {
        self.id = id
    }
    
    public func getId() -> Int? {
        return self.id ?? nil
    }
    
    public func setType(type: SettingTypeViewModel) {
        self.type = type
    }
    
    public func getType() -> SettingTypeViewModel? {
        return self.type ?? nil
    }
    
    public func getTypeId() -> Int {
        return self.type?.rawValue ?? 0
    }
    
    public func setGuid(guid: String) {
        self.guid = guid
    }
    
    public func getGuid() -> String? {
        return self.guid
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func setTitle(title: String) {
        self.title = title
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func setDescription(description: String) {
        self.description = description
    }
    
    public func getCreatedDate() -> String {
        return DateTimeHelper.getDateAsString(date: self.created)
    }
    
    public static func getTypeFromId(id: Int) -> SettingTypeViewModel? {
        if (id == 1) {
            return SettingTypeViewModel.worryTimeNotification
        }
        
        return nil
    }
}
