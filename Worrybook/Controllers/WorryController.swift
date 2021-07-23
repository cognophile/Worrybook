//
//  WorryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryController {
    var repository: WorryRepository?
    
    init() {
        self.repository = WorryRepository()
    }
    
    public func getOne(id: Int) -> WorryViewModel {
        if (id > 0) {
            let record = self.repository?.getOne(id: id)
            return WorryTranslationService.translateSingle(row: record!)
        }
        
        return WorryViewModel()
    }
    
    public func getAll() -> [WorryViewModel] {
        let records = self.repository?.getAll()
        return WorryTranslationService.translateMultiple(rows: records!)
    }
    
    public func create(viewModel: WorryViewModel) -> WorryViewModel {
        let entity = self.repository?.create(viewModel: viewModel)
        return WorryTranslationService.translateSingle(row: (entity?.record)!)
    }
    
    public func update(viewModel: WorryViewModel) -> WorryViewModel {
        let entity = self.repository?.update(viewModel: viewModel)
        return WorryTranslationService.translateSingle(row: (entity?.record)!)
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
