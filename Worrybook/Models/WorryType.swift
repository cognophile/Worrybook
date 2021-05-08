//
//  WorryType.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class WorryType {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let type = Expression<String>("type")
        
    init() {
        self.table = Table("worry_types")
    }
    
    public func createTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.type)
            })!
    }
}
