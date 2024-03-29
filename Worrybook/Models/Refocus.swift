//
//  Refocus.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class Refocus : ModelProtocol {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let title = Expression<String>("title")
    let created = Expression<Date?>("created")
    
    init() {
        self.table = Table("refocus")
    }
    
    public func instantiateTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.title)
                t.column(self.created)
            })!
    }
}
