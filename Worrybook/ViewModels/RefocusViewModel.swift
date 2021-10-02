//
//  Refocus.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class RefocusViewModel : Identifiable {
    public var id: Int? = nil
    public let uuid = UUID()
    public var title: String
    public var created: Date = Date()
    
    init(title: String?) {
        self.title = title ?? ""
    }
    
    public func getId() -> Int? {
        return self.id
    }
    
    public func setId(id: Int) {
        self.id = id
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func setTitle(title: String) {
        self.title = title
    }
    
    public func getCreatedDate() -> String {
        return DateTimeHelper.getDateAsString(date: self.created)
    }
}
