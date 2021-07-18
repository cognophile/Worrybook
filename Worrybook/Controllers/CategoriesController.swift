//
//  CategoriesController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class CategoriesController {

    init() {
    }
    
    public func getAll() -> [CategoryViewModel] {
        return [
            CategoryViewModel(title: "Family"),
            CategoryViewModel(title: "Health"),
            CategoryViewModel(title: "Relationships"),
            CategoryViewModel(title: "Work"),
            CategoryViewModel(title: "Other"),
        ]
    }
}
