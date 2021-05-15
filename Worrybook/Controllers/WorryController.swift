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
    
    private func createWorry(title: String, description: String, type: WorryTypeViewModel, solution: String?) -> WorryViewModel {
        // var worry = self.repository?.create()
        
        let model = WorryViewModel()
        model.build(title: title, description: description, type: type)
        
        return model
    }
}
