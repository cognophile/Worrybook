//
//  RefocusController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class RefocusController {
    public func getAll() -> [RefocusViewModel] {
        return [
            RefocusViewModel(title: "Read"),
            RefocusViewModel(title: "Exercise"),
            RefocusViewModel(title: "Socialise"),
            RefocusViewModel(title: "Meditate"),
            RefocusViewModel(title: "Other"),
        ]
    }
}
