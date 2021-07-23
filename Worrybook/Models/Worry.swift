//
//  Worry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class Worry: ModelProtocol {
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
    let categoryId = Expression<Int?>("category_id")
    let refocusId = Expression<Int?>("refocus_id")
        
    init() {
        self.table = Table("worry")
    }
    
    public func instantiateTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.title)
                t.column(self.description)
                t.column(self.solution)
                t.column(self.archived)
                t.column(self.created)
                t.column(self.modified)
                t.column(self.worryTypeId)
                t.column(self.categoryId)
                t.column(self.refocusId)
            })!
    }
}
