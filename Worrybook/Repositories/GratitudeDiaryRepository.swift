//
//  GratitudeDiaryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class GratitudeDiaryRepository {
    private var database = DatabaseHelper()
    private var entry = GratitudeDiaryEntry()
    
    init() {
        self.database.instantiateTable(model: entry)
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: self.entry)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.entry, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func create(viewModel: GratitudeDiaryEntryViewModel) -> GratitudeDiaryEntry {
        let query = self.entry.table!.insert(
            self.entry.title <- viewModel.title,
            self.entry.firstItem <- viewModel.firstItem,
            self.entry.secondItem <- viewModel.secondItem,
            self.entry.thirdItem <- viewModel.thirdItem,
            self.entry.archived <- viewModel.archived,
            self.entry.created <- viewModel.created
        )
        
        self.entry.record = self.database.insert(model: self.entry, query: query)
        return self.entry
    }
    
    public func update(viewModel: GratitudeDiaryEntryViewModel) -> GratitudeDiaryEntry {
        let query = [
            self.entry.title <- viewModel.title,
            self.entry.firstItem <- viewModel.firstItem,
            self.entry.secondItem <- viewModel.secondItem,
            self.entry.thirdItem <- viewModel.thirdItem,
            self.entry.archived <- viewModel.archived,
            self.entry.created <- viewModel.created
        ]
         
        self.entry.record = self.database.update(model: self.entry, index: viewModel.getId()!, query: query)
        return self.entry
    }
    
    public func delete(id: Int) -> Bool {
        let deleted = self.database.delete(model: self.entry, index: id)
        
        if (deleted != nil) {
            return true
        }
        
        return false
    }
}
