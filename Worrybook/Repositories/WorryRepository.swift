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
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.worry, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
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
    
    public func update(viewModel: WorryViewModel) -> Worry {
        let query = [
            self.worry.title <- viewModel.title,
            self.worry.description <- viewModel.description,
            self.worry.solution <- viewModel.solution,
            self.worry.archived <- viewModel.archived,
            self.worry.created <- viewModel.created,
            self.worry.modified <- viewModel.modified,
            self.worry.worryTypeId <- viewModel.getTypeId(),
            self.worry.categoryId <- 1,
            self.worry.refocusId <- 1
        ]
         
        self.worry.record = self.database.update(model: self.worry, index: viewModel.getId()!, query: query)
        return self.worry
    }
    
    public func delete(id: Int) -> Bool {
        let deleted = self.database.delete(model: self.worry, index: id)
        
        if (deleted != nil) {
            return true
        }
        
        return false
    }
}
