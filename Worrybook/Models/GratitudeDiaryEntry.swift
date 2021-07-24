//
//  GratitudeDiaryEntry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class GratitudeDiaryEntry : ModelProtocol {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let title = Expression<String>("title")
    let firstItem = Expression<String>("first_item")
    let secondItem = Expression<String?>("second_item")
    let thirdItem = Expression<String?>("third_item")
    let archived = Expression<Bool?>("archived")
    let created = Expression<Date?>("created")
    
    init() {
        self.table = Table("gratitude_diary")
    }
    
    public func instantiateTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.title)
                t.column(self.firstItem)
                t.column(self.secondItem)
                t.column(self.thirdItem)
                t.column(self.archived)
                t.column(self.created)
            })!
    }
}
