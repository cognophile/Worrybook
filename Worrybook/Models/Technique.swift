//
//  Technique.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class Technique : ModelProtocol {
    public var id = UUID()
    public var title: String
    public var description: String
    public var created: Date = Date()
    
    init() { }
}
