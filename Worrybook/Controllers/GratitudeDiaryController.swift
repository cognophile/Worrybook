//
//  GratitudeDiaryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class GratitudeDiaryController {
    var repository: GratitudeDiaryRepository?
    
    init() {
        self.repository = GratitudeDiaryRepository()
    }
    
    public func getOne(id: Int) -> GratitudeDiaryEntryViewModel {
        if (id > 0) {
            let record = self.repository?.getOne(id: id)
            return GratitudeDiaryTranslationService.translateSingle(row: record!)
        }
        
        return GratitudeDiaryEntryViewModel()
    }
    
    public func getAll() -> [GratitudeDiaryEntryViewModel] {
        let records = self.repository?.getAll()
        return GratitudeDiaryTranslationService.translateMultiple(rows: records!)
    }
    
    public func create(viewModel: GratitudeDiaryEntryViewModel) -> GratitudeDiaryEntryViewModel {
        let entity = self.repository?.create(viewModel: viewModel)
        return GratitudeDiaryTranslationService.translateSingle(row: (entity?.record)!)
    }
    
    public func update(viewModel: GratitudeDiaryEntryViewModel) -> GratitudeDiaryEntryViewModel {
        let entity = self.repository?.update(viewModel: viewModel)
        return GratitudeDiaryTranslationService.translateSingle(row: (entity?.record)!)
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
