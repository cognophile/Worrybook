//
//  GratitudeDiaryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class GratitudeDiaryController {
    init() {
        
    }
    
    public func getAll() -> [GratitudeDiaryEntry] {
        return [
            GratitudeDiaryEntry(title: "Home life", items: ["My health", "My home", "My partner and dog"]),
            GratitudeDiaryEntry(title: "Work", items: ["Starting my new job!", "Meeting my new colleagues", "Progressing on my first project"]),
            GratitudeDiaryEntry(title: "Family", items: ["My familites health", "Being able to safely visit family", "Rollout of the vaccines!"])
        ]
    }
}
