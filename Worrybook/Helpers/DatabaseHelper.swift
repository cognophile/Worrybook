//
//  DatabaseHelper.swift
//  Worrybook
//
//  Created by cognophile on 15/05/2021.
//

import Foundation
import SQLite

class DatabaseHelper {
    private var connection: Connection?
    
    init() {
        self.openConnection()
    }
    
    private func openConnection() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
        ).first!

        self.connection = try! Connection("\(path)/worrybookdb.sqlite3")
    }
    
    public func instantiateTable<T: BaseModelProtocol>(model: T) {
        try! self.connection?.run(model.instantiateTable())
    }
    
    public func selectAll<T: BaseModelProtocol>(model: T, override: QueryType? = nil) -> AnySequence<Row>? {
        if (override != nil) {
            if let records = try! self.connection?.prepare(override!) {
                return records
            }
        }
        
        if let records = try! self.connection?.prepare(model.table!) {
            return records
        }
        
        return nil
    }
    
    public func selectOne<T: BaseModelProtocol>(model: T, index: Int, override: QueryType? = nil) -> Row? {
        if (override != nil) {
            if let record = try! self.connection?.pluck(override!) {
                return record
            }
        }
        
        guard let statement = model.table?.filter(model.id == index) else { return nil }
        
        if let record = try! self.connection?.pluck(statement) {
            return record
        }
        
        return nil
    }
    
    public func insert<T: BaseModelProtocol>(model: T, query: Insert) -> Row? {
        try! self.connection?.run(query)
        guard let statement = model.table?.order(model.id.desc).limit(1) else { return nil }
        
        if let record = try! self.connection?.pluck(statement) {
            return record
        }
        
        return nil
    }
    
    public func update<T: BaseModelProtocol>(model: T, index: Int, query: [Setter]) -> Row? {
        guard let statement = model.table?.filter(model.id == index) else { return nil }
        
        if (try! self.connection?.run(statement.update(query))) != nil {
            if let updated = try! self.connection?.pluck(statement) {
                return updated
            }
        }
        
        return nil
    }
    
    
    public func delete<T: BaseModelProtocol>(model: T, index: Int) -> Int? {
        guard let statement = model.table?.filter(model.id == index) else { return nil }
        
        if let record = try! self.connection?.run(statement.delete()) {
            return record
        }
        
        return nil
    }
    
    public func deleteAll<T: BaseModelProtocol>(model: T, override: QueryType? = nil) -> Int? {
        if (override != nil) {
            if let records = try! self.connection?.run((override?.delete())!) {
                return records
            }
        }
        
        guard let statement = model.table?.delete() else { return nil }
        
        if let record = try! self.connection?.run(statement) {
            return record
        }
        
        return nil
    }
}

