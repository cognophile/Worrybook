//
//  CategoryViewModel.swift
//  Worrybook
//
//  Created by cognophile on 29/06/2021.
//

import Foundation

class CategoryViewModel : Identifiable {
    public var id: Int? = nil
    public let uuid = UUID()
    public var title: String
    public var created: Date = Date()
    
    init(title: String?) {
        self.title = title ?? ""
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getCreatedDate() -> String {
        return DateHelper.getDateAsString(date: self.created)
    }
}
