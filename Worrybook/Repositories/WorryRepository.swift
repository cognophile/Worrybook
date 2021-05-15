//
//  WorryRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class WorryRepository {
    private var database = DatabaseHelper()
    private var worry = Worry()
    
    init() {
        self.database.instantiateTable(model: worry)
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: worry)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getAllArchived() -> [Worry] {
        // Get all archived
        return [Worry()]
    }
    
    public func getOne() -> Worry {
        return Worry()
    }
    
    public func create() -> Worry {
        return Worry()
    }
    
    public func update(id: Int) -> Worry {
        return Worry()
    }
    
    public func delete(id: Int) -> Bool {
        return true
    }
}
