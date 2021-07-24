//
//  WorryViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI

class WorryViewModel : Identifiable {
    public var id: Int? = nil
    public var uuid = UUID()
    public var title: String = ""
    public var description: String = ""
    public var solution: String? = nil
    public var archived: Bool = false
    public var created: Date = Date()
    public var modified: Date? = nil
    public var type: WorryTypeViewModel = WorryTypeViewModel.hypothetical
    public var refocus: RefocusViewModel? = nil
    public var category: CategoryViewModel? = nil
    
    init() {}
    
    public func build(title: String, description: String, type: WorryTypeViewModel) {
        self.title = title
        self.description = description
        self.type = type
    }
        
    public func setId(id: Int) {
        self.id = id
    }
    
    public func getId() -> Int? {
        return self.id ?? nil
    }
    
    public func setUUID(uuid: UUID) {
        self.uuid = uuid
    }
    
    public func getUUID() -> Int {
        return self.uuid.hashValue
    }
    
    public func setTitle(title: String) {
        self.title = title
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func setDescription(description: String) {
        self.description = description
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func setSolution(solution: String) {
        self.solution = solution
    }
    
    public func getSolution() -> String? {
        return self.solution ?? nil
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
    
    public func setType(type: WorryTypeViewModel) {
        self.type = type
    }
    
    public func getType() -> WorryTypeViewModel {
        return self.type
    }
    
    public func getType() -> String {
        return self.type.rawValue
    }
    
    public func getTypeId() -> Int {
        var id: Int {
            switch (self.type) {
            case WorryTypeViewModel.hypothetical:
                return 1
            default:
                return 2
            }
        }
        
        return id
    }
    
    public func getTypeString() -> String {
        return self.type.rawValue.capitalized
    }
    
    public func isPractical() -> Bool {
        if (self.type == WorryTypeViewModel.practical) {
            return true
        }
        
        return false
    }
    
    public func getTypeColour() -> Color {
        if (self.type == WorryTypeViewModel.hypothetical) {
            return ColorHelper.getColor(r: 3, g: 96, b: 158)
        }
        
        return ColorHelper.getColor(r: 96, g: 158, b: 3)
    }
    
    public func setRefocus(refocus: RefocusViewModel) {
        self.refocus = refocus
    }
    
    public func getRefocus() -> RefocusViewModel? {
        if (self.refocus != nil) {
            return self.refocus
        }
        
        return nil
    }
    
    public func setCategory(category: CategoryViewModel) {
        self.category = category
    }
    
    public func getCategory() -> CategoryViewModel? {
        if (self.category != nil) {
            return self.category
        }
        
        return nil
    }

    public func setModifiedDate(date: Date) {
        self.modified = date
    }
    
    public func getModifiedDate() -> String? {
        return DateHelper.getDateAsString(date: self.modified!)
    }
    
    public func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}
