//
//  RefocusController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class RefocusController {
    init() {
        
    }
    
    public func getAll() -> [Refocus] {
        return [
            Refocus(title: "Read"),
            Refocus(title: "Exercise"),
            Refocus(title: "Socialise"),
            Refocus(title: "Meditate"),
            Refocus(title: "Other"),
        ]
    }
}
