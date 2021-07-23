//
//  RefocusController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class RefocusController {
    var repository: RefocusRepository?
    
    init() {
        self.repository = RefocusRepository()
    }
    
    public func getOne(id: Int) -> RefocusViewModel {
        if (id > 0) {
            let record = self.repository?.getOne(id: id)
            return RefocusTranslationService.translateSingle(row: record!)
        }
        
        return RefocusViewModel(title: nil)
    }
    
    public func getAll() -> [RefocusViewModel] {
        let records = self.repository?.getAll()
        return RefocusTranslationService.translateMultiple(rows: records!)
    }
}
