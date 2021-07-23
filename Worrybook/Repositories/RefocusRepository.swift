//
//  RefocusRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class RefocusRepository {
    private var database = DatabaseHelper()
    private var refocus = Refocus()
    private var data = [
        RefocusViewModel(title: "Read"),
        RefocusViewModel(title: "Exercise"),
        RefocusViewModel(title: "Socialise"),
        RefocusViewModel(title: "Meditate"),
        RefocusViewModel(title: "Other"),
    ]
    
    init() {
        self.database.instantiateTable(model: refocus)
        self.seed()
    }
    
    private func seed() {
        let count = self.database.count(model: self.refocus)
        
        if (count != nil && count == 0) {
            self.data.forEach { vm in
                _ = self.create(viewModel: vm)
            }
        }
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: self.refocus)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.refocus, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func create(viewModel: RefocusViewModel) -> Refocus {
        let query = self.refocus.table!.insert(
            self.refocus.title <- viewModel.title,
            self.refocus.created <- viewModel.created
        )
        
        self.refocus.record = self.database.insert(model: self.refocus, query: query)
        return self.refocus
    }
}
