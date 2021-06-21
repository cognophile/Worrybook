//
//  WorryType.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class WorryType: BaseModelProtocol {
    var table: Table?
    var record: Row?
    
    var id = Expression<Int>("id")
    let type = Expression<String>("type")
        
    init() {
        self.table = Table("worry_type")
    }
    
    public func instantiateTable() -> String {
        return (self.table?.create(ifNotExists: true) {
            t in
                t.column(self.id, primaryKey: true)
                t.column(self.type)
            })!
    }
    
    public static func getTypeFromId(id: Int) -> WorryTypeViewModel {
        return id == 1 ? WorryTypeViewModel.hypothetical : WorryTypeViewModel.practical
    }
}
