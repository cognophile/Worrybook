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
    
    public func create(viewModel: WorryViewModel) -> Worry {
        let query = self.worry.table!.insert(
            self.worry.title <- viewModel.title,
            self.worry.description <- viewModel.description,
            self.worry.solution <- viewModel.solution,
            self.worry.archived <- viewModel.archived,
            self.worry.created <- viewModel.created,
            self.worry.modified <- viewModel.modified,
            self.worry.worryTypeId <- viewModel.getTypeId(),
            self.worry.categoryId <- 1,
            self.worry.refocusId <- 1
        )
        
        self.worry.record = self.database.insert(model: self.worry, query: query)
        return self.worry
    }
    
    public func update(id: Int) -> Worry {
        return Worry()
    }
    
    public func delete(id: Int) -> Bool {
        return true
    }
}
