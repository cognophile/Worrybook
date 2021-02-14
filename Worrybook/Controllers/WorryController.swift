//
//  WorryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryController {
    init() {
        
    }
    
    public func getAll() -> [Worry] {
        return [
            Worry(
                title: "Personal health",
                description: "I am worried because I've had new and strange sensations in my legs",
                type: WorryType.hypothetical,
                solution: nil
            ),
            Worry(
                title: "University dissertation",
                description: "I'm having trouble deciding and planning my dissertation project and am running out of time!",
                type: WorryType.practical,
                solution: "Emailed Willow, my supervisor, for a meeting to discuss."
            ),
            Worry(
                title: "Wedding planning",
                description: "With everything going on at work and university, I'm not finding the time to help plan the wedding and I'm worried we're going to have to reschedule everything if we leave it too late.",
                type: WorryType.practical,
                solution: "Speak to my partner and find wedding planner services"
            )
        ]
    }
}
