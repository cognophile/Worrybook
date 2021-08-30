//
//  Setting.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

import Foundation
import SQLite

class Setting : ModelProtocol {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let type = Expression<Int>("type")
    let title = Expression<String>("title")
    let description = Expression<String>("description")
    let guid = Expression<String>("guid")
    let created = Expression<Date?>("created")
    
    init() {
        self.table = Table("settings")
    }
    
    public func instantiateTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.type)
                t.column(self.title)
                t.column(self.description)
                t.column(self.guid)
                t.column(self.created)
            })!
    }
}
