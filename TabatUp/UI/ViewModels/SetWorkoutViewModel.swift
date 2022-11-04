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
    @Published var prepareTime: String {didSet{currentlyModifiedValue = prepareTime}}
    /// The round workout time.
    @Published var workTime: String {didSet{currentlyModifiedValue = workTime}}
    /// The rest time between cycles.
    @Published var restBetweenCycles: String {didSet{currentlyModifiedValue = restBetweenCycles}}
    /// The number of cycles in each set.
    @Published var cycles: String {didSet{currentlyModifiedValue = cycles}}
    /// The number of sets in the workout.
    @Published var sets: String {didSet{currentlyModifiedValue = sets}}
    /// The rest time between sets.
    @Published var restBetweenSets: String {didSet{currentlyModifiedValue = restBetweenSets}}
    /// A string representing the value of the property that is being modified.
    @Published var currentlyModifiedValue: String?
        
    // MARK: - Lifecycle
    init(withWorkoutModel workout: SetWorkoutModel) {
        self.title = workout.title
        self.prepareTime = String(workout.prepareTime)
        self.workTime = String(workout.workTime)
        self.restBetweenCycles = String(workout.restBetweenCycles)
        self.cycles = String(workout.cycles)
        self.sets = String(workout.sets)
        self.restBetweenSets = String(workout.restBetweenSets)
    }
}
