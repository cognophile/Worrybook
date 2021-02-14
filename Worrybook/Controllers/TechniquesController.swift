//
//  TechniquesController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class TechniquesController {
    init() {
        
    }
    
    public func getAll() -> [Technique] {
        return [
            Technique(title: "Box breathing", description: "Breath in for 4 seconds, hold for 4 seconds, out for 6 seconds"),
            Technique(title: "Five senses", description: "Name 5 things you can see, 4 you can hear, 3 you can touch, 2 you can smell, and 1 you can taste"),
            Technique(title: "Mindfulness", description: "Sit calmly, take two deep breaths then close your eyes. Then, focus your attention on where you most feel each breath. If your mind wanders, accept it, and refocus on your breathing")
        ]
    }
}
