//
//  SetWorkoutViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import Foundation
import Combine


final class SetWorkoutViewModel: ObservableObject {
    // MARK: - Properties
    /// The title of the workout.
    @Published var title: String
    /// The time to prepare before the whole workout starts.
    @Published var prepareTime: Int
    /// The round workout time.
    @Published var workTime: Int
    /// The rest time between cycles.
    @Published var restBetweenCycles: Int
    /// The number of cycles in each set.
    @Published var cycles: Int
    /// The number of sets in the workout.
    @Published var sets: Int
    /// The rest time between sets.
    @Published var restBetweenSets: Int
    
    // MARK: - Lifecycle
    init(withWorkoutModel workout: SetWorkoutModel) {
        self.title = workout.title
        self.prepareTime = workout.prepareTime
        self.workTime = workout.workTime
        self.restBetweenCycles = workout.restBetweenCycles
        self.cycles = workout.cycles
        self.sets = workout.sets
        self.restBetweenSets = workout.restBetweenSets
    }
}
