//
//  TechniquesRepository.swift
//  Worrybook
//
//  Created by cognophile
//

import Foundation
import SQLite

class TechniqueRepository {
    private var database = DatabaseHelper()
    private var technique = Technique()
    
    private var data = [
        TechniqueViewModel(title: "Box breathing", description: "Breathe in for 4 seconds, hold for 4 seconds, out for 4 seconds."),
        TechniqueViewModel(title: "Five senses (grounding)", description: "To bring yourself back to the current moment in time, name 5 things you can see, 4 you can hear, 3 you can touch, 2 you can smell, and 1 you can taste."),
        TechniqueViewModel(title: "All the 3s", description: "Simlar to the Five Senses technique, identify 3 things you can see, 3 things you can hear, and move 3 parts of your body and focus on each one as you do."),
        TechniqueViewModel(title: "Mindfulness", description: "Sit calmly, take two deep breaths then close your eyes. Then, focus your attention on where you most feel each breath. If your mind wanders, accept it, and refocus on your breathing. Slow and deepen your breathing to encourage your body to stop the instinctive alarms."),
        TechniqueViewModel(title: "Object focus", description: "Find an object in sight and examine it from all perspectives - movement, size, colour, shape, feel, smell, patterns."),
        TechniqueViewModel(title: "Muscle relaxation", description: "Starting at the top of your head, select a muscle group and hold them tense for 5 seconds whilst breathing in. Release them instantly whilst breathing out. Relax for 15 seconds, then repeat for the next muscle group, all the way down to your toes."),
        TechniqueViewModel(title: "Safe place", description: "Close your eyes and imagine or remember a place where you feel calm, peaceful, and safe. Look around - notice the colours and shapes, the smells and textures, sounds and sensations. Whilst you enjoy this place, give it a name - a brief word to associate to cast yourself back when you say or hear it in future. When you're ready, open your eyes."),
        TechniqueViewModel(title: "Worry diary", description: "Try to think about what's worrying you and why, and write it down on paper or in this app. If you don't know, write that too! Record when and where it happened, how you felt, and how intense it was."),
        TechniqueViewModel(title: "Worry time", description: "Set aside 10-15 minutes daily to review your worry diary. If it doesn't worry you anymore, delete or destroy it. If it does, write it again and consider whether you can address it.")
    ]
    
    init() {
        self.database.instantiateTable(model: technique)
        self.seed()
    }
    
    private func seed() {
        let count = self.database.count(model: self.technique)
        
        if (count != nil && count == 0) {
            self.data.forEach { vm in
                _ = self.create(viewModel: vm)
            }
        }
    }
    
    public func getAll() -> [Row]? {
        let records = self.database.selectAll(model: technique)
        
        if records != nil {
            return Array(records!)
        }
        
        return nil
    }
    
    public func getOne(id: Int) -> Row? {
        let record = self.database.selectOne(model: self.technique, index: id)
        
        if record != nil {
            return record
        }
        
        return nil
    }
    
    public func create(viewModel: TechniqueViewModel) -> Technique {
        let query = self.technique.table!.insert(
            self.technique.title <- viewModel.title,
            self.technique.description <- viewModel.description,
            self.technique.created <- viewModel.created
        )
        
        self.technique.record = self.database.insert(model: self.technique, query: query)
        return self.technique
    }
    
    public func update(viewModel: TechniqueViewModel) -> Technique {
        let query = [
            self.technique.title <- viewModel.title,
            self.technique.description <- viewModel.description,
            self.technique.created <- viewModel.created
        ]
         
        self.technique.record = self.database.update(model: self.technique, index: viewModel.getId()!, query: query)
        return self.technique
    }
    
    public func delete(id: Int) -> Bool {
        let deleted = self.database.delete(model: self.technique, index: id)

        if (deleted != nil) {
            return true
        }

        return false
    }
    
    public func deleteAll() {
        self.database.deleteAll(model: self.technique)
    }
}
