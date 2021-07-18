//
//  WorryModelTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class WorryTranslationService {
    init() {
        
    }
    
    public static func translateSingle(row: Row) -> WorryViewModel {
        let model = Worry()
        let worry = WorryViewModel()
        
        let typeId = (try! row.get(model.worryTypeId))
        worry.id = try! row.get(model.id)
        worry.build(
            title: try! row.get(model.title),
            description: try! row.get(model.description),
            type: WorryType.getTypeFromId(id: typeId)
        )
        worry.solution = try! row.get(model.solution)
        worry.archived = try! row.get(model.archived)!
        worry.created = try! row.get(model.created)!
        worry.modified = try! row.get(model.modified)
        
//      worry.refocus = try! row.get(model.refocusId)
//      worry.category = try! row.get(model.categoryId)
        
        return worry
    }
    
    public static func translateMultiple(rows: [Row]) -> [WorryViewModel] {
        var worries = [WorryViewModel]()
        
        for row in rows {
            worries.append(self.translateSingle(row: row))
        }
        
        return worries
    }
}
