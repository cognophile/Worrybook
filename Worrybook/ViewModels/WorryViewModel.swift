//
//  WorryViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI

class WorryViewModel : Identifiable {
    public let id = UUID()
    public var recordId: Int? = nil
    public var title: String = ""
    public var description: String = ""
    public var solution: String? = nil
    public var archived: Bool = false
    public var created: Date = Date()
    public var modified: Date? = nil
    public var type: WorryTypeViewModel = WorryTypeViewModel.hypothetical
    public var refocus: Refocus? = nil
    public var category: Category? = nil
    
    init() {}
    
    public func build(title: String, description: String, type: WorryTypeViewModel) {
        self.title = title
        self.description = description
        self.type = type
    }
    
    public func setRecordId(id: Int) {
        self.recordId = id
    }
    
    public func getRecordId() -> Int? {
        return self.recordId ?? nil
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
    
    public func setType(type: WorryTypeViewModel) {
        self.type = type
    }
    
    public func getType() -> WorryTypeViewModel {
        return self.type
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
    
    public func setSolution(solution: String) {
        self.solution = solution
    }
    
    public func getSolution() -> String? {
        if (self.solution != nil) {
            return self.solution
        }
        
        return nil
    }
    
    public func setRefocus(refocus: Refocus) {
        self.refocus = refocus
    }
    
    public func getRefocus() -> Refocus? {
        if (self.refocus != nil) {
            return self.refocus
        }
        
        return nil
    }
    
    public func setCategory(category: Category) {
        self.category = category
    }
    
    public func getCategory() -> Category? {
        if (self.category != nil) {
            return self.category
        }
        
        return nil
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
