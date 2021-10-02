//
//  CategoriesController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class CategoriesController {
    var repository: CategoryRepository?
    
    init() {
        self.repository = CategoryRepository()
    }
    
    public func getOne(id: Int) -> CategoryViewModel {
        if (id > 0) {
            let record = self.repository?.getOne(id: id)
            return CategoryTranslationService.translateSingle(row: record!)
        }
        
        return CategoryViewModel(title: nil)
    }
    
    public func getAll() -> [CategoryViewModel] {
        let records = self.repository?.getAll()
        return CategoryTranslationService.translateMultiple(rows: records!)
    }
    
    public func create(viewModel: CategoryViewModel) -> CategoryViewModel {
        let entity = self.repository?.create(viewModel: viewModel)
        return CategoryTranslationService.translateSingle(row: (entity?.record)!)
    }
    
    public func delete(id: Int) -> Bool {
        if (id > 0) {
            let entity = self.repository?.delete(id: id)
            
            if (entity != nil) {
                return true
            }
        }
        
        return false
    }
}
