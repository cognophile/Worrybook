//
//  BaseModelProtocol.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

protocol BaseModelProtocol {
    var table: Table? { get set }
    var record: Row? { get set }
    var id: Expression<Int> { get set }
    
    func instantiateTable() -> String
}
