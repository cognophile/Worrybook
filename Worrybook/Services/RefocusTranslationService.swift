//
//  RefocusModelTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class RefocusTranslationService {
    init() { }
    
    public static func translateSingle(row: Row) -> RefocusViewModel {
        let model = Refocus()
        let refocus = RefocusViewModel(title: nil)
        
        refocus.id = try! row.get(model.id)
        refocus.title = try! row.get(model.title)
        refocus.created = try! row.get(model.created)!
        
        return refocus
    }
    
    public static func translateMultiple(rows: [Row]) -> [RefocusViewModel] {
        var refocues = [RefocusViewModel]()
        
        for row in rows {
            refocues.append(self.translateSingle(row: row))
        }
        
        return refocues
    }
    
    public static func hydrate(id: Int) -> RefocusViewModel {
        let repository = RefocusRepository()
        let row = repository.getOne(id: id)!
        return RefocusTranslationService.translateSingle(row: row)
    }
}
