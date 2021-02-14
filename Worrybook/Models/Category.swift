//
//  Category.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class Category : Identifiable {
    public var id = UUID()
    public var title: String
    public var created: Date = Date()
    
    init(title: String) {
        self.title = title
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}
