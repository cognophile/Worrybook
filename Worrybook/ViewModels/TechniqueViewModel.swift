//
//  TechniqueViewModel.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class TechniqueViewModel : Identifiable {
    public var id: Int? = nil
    public var uuid = UUID()
    public var title: String = ""
    public var description: String = ""
    public var created: Date = Date()
    
    init(title: String?, description: String?) {
        self.title = title ?? ""
        self.description = description ?? ""
    }
    
    public func setId(id: Int) {
        self.id = id
    }

    public func getId() -> Int? {
        return self.id ?? nil
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getTitle(title: String) {
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
}
