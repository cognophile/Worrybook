//
//  GratitudeDiaryEntryViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class GratitudeDiaryEntryViewModel : Identifiable {
    public var id: Int? = nil
    public var uuid = UUID()
    public var title: String = ""
    public var firstItem: String = ""
    public var secondItem: String = ""
    public var thirdItem: String = ""
    public var archived: Bool = false
    public var created: Date = Date()
    
    init () {}
    
    public func setId(id: Int) {
        self.id = id
    }
    
    public func getId() -> Int? {
        return self.id ?? nil
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getItems() -> [String] {
        return [self.firstItem, self.secondItem, self.thirdItem]
    }
    
    public func setItems(first: String, second: String, third: String) {
        self.firstItem = first
        self.secondItem = second
        self.thirdItem = third
    }
    
    public func addItem(entry: String) -> Bool {
        var success = false
        
        if (self.firstItem.isEmpty) {
            self.firstItem = entry
            success = true
        }
        
        if (self.secondItem.isEmpty) {
            self.secondItem = entry
            success = true
        }
        
        if (self.thirdItem.isEmpty) {
            self.thirdItem = entry
            success = true
        }
        
        return success
    }
    
    public func getCreatedDate() -> String {
        return DateTimeHelper.getDateAsString(date: self.created)
    }
    
    public func isArchived() -> Bool {
        return (self.archived) ? true : false;
    }
    
    public func archive() {
        self.archived = true;
    }
    
    public func unArchive() {
        self.archived = false;
    }
}
