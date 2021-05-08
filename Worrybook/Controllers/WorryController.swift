//
//  WorryController.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation

class WorryController {
    var repository: WorryRepository?
    
    init() {
        self.repository = WorryRepository()
    }
    
    public func getAll() -> [WorryViewModel] {
        var worries = self.repository?.getAll()
        return [WorryViewModel(title: "", description: "", type: WorryTypeViewModel.hypothetical, solution: "")]
    }
    
    private func createWorry(title: String, description: String, type: WorryTypeViewModel, solution: String?) -> WorryViewModel {
        var worry = self.repository?.create()
        
        return
            WorryViewModel(
                title: title,
                description: description,
                type: type,
                solution: solution
            )
    }
}
