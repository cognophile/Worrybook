//
//  TranslationServiceProtocol.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

protocol TranslationServiceModelProtocol {
    func translateSingle(row: Row) -> ViewModelProtocol
    func translateMultiple(rows: [Row]) -> [ViewModelProtocol]
}
