//
//  RepositoryProtocol.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

protocol RepositoryProtocol {
    func getAll() -> [Row]?
    func getOne(id: Int) -> Row?
    func create(viewModel: ViewModelProtocol) -> ModelProtocol
    func update(viewModel: ViewModelProtocol) -> ModelProtocol
    func delete(id: Int) -> Bool
}
