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
    
    init() {
        self.database.instantiateTable(model: category)
    }
}
