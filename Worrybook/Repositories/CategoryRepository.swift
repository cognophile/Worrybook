//
//  CategoryRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class CategoryRepository {
    private var database = DatabaseHelper()
    private var category = Category()
    private var data = [
        CategoryViewModel(title: "Family"),
        CategoryViewModel(title: "Health"),
        CategoryViewModel(title: "Relationships"),
        CategoryViewModel(title: "Work"),
        CategoryViewModel(title: "Other"),
    ]
    
    init() {
        self.database.instantiateTable(model: self.category)
        self.seed()
    }
    
    private func seed() {
        let count = self.database.count(model: self.category)
        
        if (count != nil && count == 0) {
            self.data.forEach { vm in
                _ = self.create(viewModel: vm)
            }
        }
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: self.category)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.category, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func create(viewModel: CategoryViewModel) -> Category {
        let query = self.category.table!.insert(
            self.category.title <- viewModel.title,
            self.category.created <- viewModel.created
        )
        
        self.category.record = self.database.insert(model: self.category, query: query)
        return self.category
    }
}
