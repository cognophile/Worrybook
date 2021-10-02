//
//  GratitudeDiaryTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class GratitudeDiaryTranslationService {
    init() { }
    
    public static func translateSingle(row: Row) -> GratitudeDiaryEntryViewModel {
        let model = GratitudeDiaryEntry()
        let entry = GratitudeDiaryEntryViewModel()
        
        entry.id = try! row.get(model.id)
        entry.firstItem = try! row.get(model.firstItem)
        entry.secondItem = try! row.get(model.secondItem)!
        entry.thirdItem = try! row.get(model.thirdItem)!
        entry.archived = try! row.get(model.archived)!
        entry.created = try! row.get(model.created)!
        
        return entry
    }
    
    public static func translateMultiple(rows: [Row]) -> [GratitudeDiaryEntryViewModel] {
        var worries = [GratitudeDiaryEntryViewModel]()
        
        for row in rows {
            worries.append(self.translateSingle(row: row))
        }
        
        return worries
    }
}
