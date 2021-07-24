//
//  TechniquesController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class TechniquesController {
    var repository: TechniqueRepository?
    
    init() {
        self.repository = TechniqueRepository()
    }
    
    public func getOne(id: Int) -> TechniqueViewModel {
        if (id > 0) {
            let record = self.repository?.getOne(id: id)
            return TechniqueTranslationService.translateSingle(row: record!)
        }
        
        return TechniqueViewModel(title: nil, description: nil)
    }
    
    public func getAll() -> [TechniqueViewModel] {
        let records = self.repository?.getAll()
        return TechniqueTranslationService.translateMultiple(rows: records!)
    }
    
    public func create(viewModel: TechniqueViewModel) -> TechniqueViewModel {
        let entity = self.repository?.create(viewModel: viewModel)
        return TechniqueTranslationService.translateSingle(row: (entity?.record)!)
    }
    
    public func update(viewModel: TechniqueViewModel) -> TechniqueViewModel {
        let entity = self.repository?.update(viewModel: viewModel)
        return TechniqueTranslationService.translateSingle(row: (entity?.record)!)
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
    
    public func deleteAll() {
        ((self.repository?.deleteAll()) != nil)
    }
}
