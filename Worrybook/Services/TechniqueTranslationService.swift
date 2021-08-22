//
//  TechniqueTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class TechniqueTranslationService {
    init() { }
    
    public static func translateSingle(row: Row) -> TechniqueViewModel {
        let model = Technique()
        let technique = TechniqueViewModel(title: nil, description: nil)
        
        technique.id = try! row.get(model.id)
        technique.title = try! row.get(model.title)
        technique.description = try! row.get(model.description)
        technique.created = try! row.get(model.created)!
        
        return technique
    }
    
    public static func translateMultiple(rows: [Row]) -> [TechniqueViewModel] {
        var techniques = [TechniqueViewModel]()
        
        for row in rows {
            techniques.append(self.translateSingle(row: row))
        }
        
        return techniques
    }
}
