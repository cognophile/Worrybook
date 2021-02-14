//
//  Worry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI

class Worry : Identifiable {
    public var id = UUID()
    public var title: String
    public var description: String
    public var type: WorryType
    public var solution: String? = nil
    public var archived: Bool = false
    public var created: Date = Date()
    public var modified: Date? = nil
    public var refocus: Refocus? = nil
    public var category: Category? = nil
        
    init(title: String, description: String, type: WorryType, solution: String?) {
        self.title = title
        self.description = description
        self.type = type
        
        if (solution != nil) {
            self.solution = solution
        }
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func setDescription(description: String) {
        self.description = description
    }
    
    func getDescription() -> String {
        return self.description
    }
    
    func setType(type: WorryType) {
        self.type = type
    }
    
    func getType() -> WorryType {
        return self.type
    }
    
    func getTypeString() -> String {
        return self.type.rawValue.capitalized
    }
    
    func getTypeColour() -> Color {
        if (self.type == WorryType.hypothetical) {
            return ColorHelper.getColor(r: 3, g: 96, b: 158)
        }
        
        return ColorHelper.getColor(r: 96, g: 158, b: 3)
    }
    
    func setSolution(solution: String) {
        self.solution = solution
    }
    
    func getSolution() -> String? {
        if (self.solution != nil) {
            return self.solution
        }
        
        return nil
    }
    
    func setRefocus(refocus: Refocus) {
        self.refocus = refocus
    }
    
    func getRefocus() -> Refocus? {
        if (self.refocus != nil) {
            return self.refocus
        }
        
        return nil
    }
    
    func setCategory(category: Category) {
        self.category = category
    }
    
    func getCategory() -> Category? {
        if (self.category != nil) {
            return self.category
        }
        
        return nil
    }
    
    func isArchived() -> Bool {
        return (self.archived) ? true : false;
    }
    
    func archive() {
        self.archived = true;
    }
    
    func unArchive() {
        self.archived = false;
    }

    func setModifiedDate(date: Date) {
        self.modified = date
    }
    
    func getModifiedDate() -> Date? {
        return self.modified ?? nil
    }
    
    func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}

