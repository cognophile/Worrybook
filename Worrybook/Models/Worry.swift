//
//  Worry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SwiftUI
import SQLite

class Worry {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let title = Expression<String>("title")
    let description = Expression<String>("description")
    let solution = Expression<String?>("solution")
    let archived = Expression<Bool?>("archived")
    let created = Expression<Date?>("created")
    let modified = Expression<Date?>("modified")
    
    let worryTypeId = Expression<Int>("worry_type_id")

//    public var type: WorryType? = nil
//    public var refocus: Refocus? = nil
//    public var category: Category? = nil
        
    init() {
        self.table = Table("worries")
    }
    
    public func createTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.title)
                t.column(self.description)
                t.column(self.solution)
                t.column(self.archived)
                t.column(self.created)
                t.column(self.modified)
            })!
    }
    
//    public func getCategory() -> Category {
//        Get the data for this worry, and transform it. These will be called from controllers and populated into an array on the ViewModel of usable Objects
//        If the member isn't populated, retrieve the data and populate it, otherwise return the member
//    }
//
//    public func getRefocus() -> Refocus {
//        Get the data for this worry, and transform it. These will be called from controllers and populated into an array on the ViewModel of usable Objects
//        If the member isn't populated, retrieve the data and populate it, otherwise return the member
//    }
//
//    public func getWorryType() -> Refocus {
//        Get the name for the worry type on this model, by ID
//        If the member isn't populated, retrieve the data and populate it, otherwise return the member
//    }
}
