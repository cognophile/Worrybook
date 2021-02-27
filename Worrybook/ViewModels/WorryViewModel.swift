//
//  Worry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryViewModel : Identifiable {
    public let id = UUID()
    public var worry: Worry
    
    init(worry: Worry?) {
        self.worry = worry ?? Worry(title: "", description: "", type: WorryType.practical, solution: "")
    }
}
