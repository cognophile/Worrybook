//
//  Worry.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryViewModel : Identifiable {
    public var id = UUID()
    public var title: String?
    public var description: String?
    public var type: WorryType?
    public var refocus: Refocus? = nil
    public var solution: String? = nil
    public var archived: Bool = false
    public var created: Date = Date()
    public var modified: Date? = nil
}
