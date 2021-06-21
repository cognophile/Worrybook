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
    
    public func getAll() -> [WorryViewModel] {
        let records = self.repository?.getAll()
        return WorryTranslationService.translateMultiple(rows: records!)
    }
    
    public func create(viewModel: WorryViewModel) -> WorryViewModel {
        let entity = self.repository?.create(viewModel: viewModel)
        return WorryTranslationService.translateSingle(row: (entity?.record)!)
    }
}
