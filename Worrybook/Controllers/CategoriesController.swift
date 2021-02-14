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
    
    public func getAll() -> [Category] {
        return [
            Category(title: "Family"),
            Category(title: "Health"),
            Category(title: "Relationships"),
            Category(title: "Work"),
            Category(title: "Other"),
        ]
    }
}
