//
//  WorryRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryRepository {
    init() {
        
    }
    
    public func getAll() -> [Worry] {
        // Get all non-archived
        return [Worry()]
    }
    
    public func getAllArchived() -> [Worry] {
        // Get all archived
        return [Worry()]
    }
    
    public func getOne() -> Worry {
        return Worry()
    }
    
    public func create() -> Worry {
        return Worry()
    }
    
    public func update(id: Int) -> Worry {
        return Worry()
    }
    
    public func delete(id: Int) -> Bool {
        return true
    }
}
