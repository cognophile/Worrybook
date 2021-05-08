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
    public var title: String
    public var description: String
    public var solution: String?
    public var archived: Bool
    public var created: Date
    public var modified: Date?
    public var type: WorryTypeViewModel
    public var refocus: Refocus? = nil
    public var category: Category? = nil
    
    init(title: String, description: String, type: WorryTypeViewModel, solution: String?) {
        self.title = title
        self.description = description
        self.type = type
        self.solution = solution
        self.archived = false
        self.created = Date()
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
    
    func setType(type: WorryTypeViewModel) {
        self.type = type
    }
    
    func getType() -> WorryTypeViewModel {
        return self.type
    }
    
    func getTypeString() -> String {
        return self.type.rawValue.capitalized
    }
    
    func getTypeColour() -> Color {
        if (self.type == WorryTypeViewModel.hypothetical) {
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
    
    func getModifiedDate() -> String? {
        return DateHelper.getDateAsString(date: self.modified!)
    }
    
    func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
    
    func isPractical() -> Bool {
        if (self.type == WorryTypeViewModel.practical) {
            return true
        }
        
        return false
    }
}
