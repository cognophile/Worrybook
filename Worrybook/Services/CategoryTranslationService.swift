//
//  CategoryTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class CategoryTranslationService {
    init() { }
    
    public static func translateSingle(row: Row) -> CategoryViewModel {
        let model = Category()
        let refocus = CategoryViewModel(title: nil)
        
        refocus.id = try! row.get(model.id)
        refocus.title = try! row.get(model.title)
        refocus.created = try! row.get(model.created)!
        
        return refocus
    }
    
    public static func translateMultiple(rows: [Row]) -> [CategoryViewModel] {
        var refocues = [CategoryViewModel]()
        
        for row in rows {
            refocues.append(self.translateSingle(row: row))
        }
        
        return refocues
    }
    
    public static func hydrate(id: Int) -> CategoryViewModel {
        let repository = CategoryRepository()
        let row = repository.getOne(id: id)!
        return CategoryTranslationService.translateSingle(row: row)
    }
}
