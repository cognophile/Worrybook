//
//  SettingsRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class SettingsRepository {
    private var database = DatabaseHelper()
    private var setting = Setting()
    
    init() {
        self.database.instantiateTable(model: setting)
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: self.setting)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.setting, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func getOneByGuid(guid: String) -> Row? {
        let query = setting.table?.select(self.setting.table![*]).filter(self.setting.guid == guid)
        let record = self.database.selectOne(model: self.setting, index: 0, override: query)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func create(viewModel: SettingViewModel) -> Setting {
        let query = self.setting.table!.insert(
            self.setting.type <- viewModel.getTypeId(),
            self.setting.title <- viewModel.title,
            self.setting.description <- viewModel.description,
            self.setting.guid <- viewModel.guid,
            self.setting.created <- viewModel.created
        )
        
        self.setting.record = self.database.insert(model: self.setting, query: query)
        return self.setting
    }
    
    public func update(viewModel: SettingViewModel) -> Setting {
        let query = [
            self.setting.type <- viewModel.getTypeId(),
            self.setting.title <- viewModel.title,
            self.setting.description <- viewModel.description,
            self.setting.guid <- viewModel.guid,
            self.setting.created <- viewModel.created
        ]
         
        self.setting.record = self.database.update(model: self.setting, index: viewModel.getId()!, query: query)
        return self.setting
    }
    
    public func delete(id: Int) -> Bool {
        let deleted = self.database.delete(model: self.setting, index: id)
        
        if (deleted != nil) {
            return true
        }
        
        return false
    }
}
