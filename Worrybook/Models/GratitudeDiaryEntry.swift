//
//  GratitudeDiaryEntry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class GratitudeDiaryEntry : Identifiable {
    public var id = UUID()
    public var title: String
    public var items: [String] = []
    public var created: Date = Date()

    init (title: String, items: [String]) {
        self.title = title
        self.items = items
    }
    
    func getTitle() -> String {
        return self.title
    }
    
    func getItems() -> [String] {
        return self.items
    }
    
    func addItem(entry: String) {
        if (self.items.count < 3) {
            self.items.append(entry)
        }
    }
    
    func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}
