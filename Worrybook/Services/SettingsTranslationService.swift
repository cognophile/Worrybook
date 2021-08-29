//
//  SettingsTranslationService.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class SettingsTranslationService {
    init() { }
    
    public static func translateSingle(row: Row) -> SettingViewModel {
        let model = Setting()
        let viewModel = SettingViewModel()
        let typeId = try! row.get(model.type)
        
        viewModel.id = try! row.get(model.id)
        viewModel.type = SettingViewModel.getTypeFromId(id: typeId)
        viewModel.title = try! row.get(model.title)
        viewModel.description = try! row.get(model.description)
        viewModel.guid = try! row.get(model.guid)
        viewModel.created = try! row.get(model.created)!
        
        return viewModel
    }
    
    public static func translateMultiple(rows: [Row]) -> [SettingViewModel] {
        var settings = [SettingViewModel]()
        
        for row in rows {
            settings.append(self.translateSingle(row: row))
        }
        
        return settings
    }
}
