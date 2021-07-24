//
//  TechniqueViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class TechniqueViewModel : Identifiable {
    public var id = UUID()
    public var title: String
    public var description: String
    public var created: Date = Date()
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getDescription() -> String {
        return self.description
    }
    
    public func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}
