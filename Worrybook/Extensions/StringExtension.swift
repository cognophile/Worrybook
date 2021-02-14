//
//  StringExtension.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

extension String {
    func capitalize() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalize() {
        self = self.capitalize()
    }
}
