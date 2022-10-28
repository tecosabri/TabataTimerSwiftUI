//
//  SetWorkoutModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation

// This is a class to support future CoreData implementation

/// A workout represented by a unique title.
final class SetWorkoutModel {
    // MARK: - Properties
    /// The title of the workout.
    var title: String
    /// The time to prepare before the whole workout starts.
    var prepareTime: Int
    /// The round workout time.
    var workTime: Int
    /// The rest time between cycles.
    var restBetweenCycles: Int
    /// The number of cycles in each set.
    var cycles: Int
    /// The number of sets in the workout.
    var sets: Int
    /// The rest time between sets.
    var restBetweenSets: Int
    
    // MARK: - Lifecycle
    init(title: String = "",
         prepareTime: Int = 10,
         workTime: Int = 30,
         restBetweenCycles: Int = 10,
         cycles: Int = 4,
         sets: Int = 1,
         restBetweenSets: Int = 0) {
        
        self.title = title
        self.prepareTime = prepareTime
        self.workTime = workTime
        self.restBetweenCycles = restBetweenCycles
        self.cycles = cycles
        self.sets = sets
        self.restBetweenSets = restBetweenSets
    }
}
