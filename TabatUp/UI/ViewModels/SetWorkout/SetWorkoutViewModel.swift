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
    @Published var prepareTime: String {didSet{currentlyModifiedItem = [.prepareTime: prepareTime]}}
    /// The round workout time.
    @Published var workTime: String {didSet{currentlyModifiedItem = [.workTime: workTime]}}
    /// The rest time between cycles.
    @Published var restBetweenCycles: String {didSet{currentlyModifiedItem = [.restBetweenCycles: restBetweenCycles]}}
    /// The number of cycles in each set.
    @Published var cycles: String {didSet{currentlyModifiedItem = [.cycles: cycles]}}
    /// The number of sets in the workout.
    @Published var sets: String {didSet{currentlyModifiedItem = [.sets: sets]}}
    /// The rest time between sets.
    @Published var restBetweenSets: String {didSet{currentlyModifiedItem = [.restBetweenSets: restBetweenSets]}}
    /// A string representing the value of the property that is being modified.
    @Published var currentlyModifiedItem: [SetWorkoutOption: String]?
    /// The items corresponding the different options of a workout
    var items: [SetWorkoutOption: SetWorkoutItemViewModel] = [:]
        
    // MARK: - Lifecycle
    init(withWorkoutModel workout: SetWorkoutModel) {
        self.title = workout.title
        self.prepareTime = String(workout.prepareTime)
        self.workTime = String(workout.workTime)
        self.restBetweenCycles = String(workout.restBetweenCycles)
        self.cycles = String(workout.cycles)
        self.sets = String(workout.sets)
        self.restBetweenSets = String(workout.restBetweenSets)
        populateItems()
    }
    
    // MARK: - Preset functions
    /// Populates the items of the workout view model with the data stored in a workout model. Function to be called after the initiialization of the other properties
    func populateItems() {
        items[.title] = SetWorkoutItemViewModel(workoutOption: .title, fromSetWorkoutViewModel: self)
        items[.prepareTime] = SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: self)
        items[.workTime] = SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: self)
        items[.restBetweenCycles] = SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: self)
        items[.cycles] = SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: self)
        items[.sets] = SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: self)
        items[.restBetweenSets] = SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: self)
    }
    
    
    /// Indicates wheter the currently modified item has been tapped once.
    /// - Returns: True if the currently modified item has been tapped once, false otherwise.
    func currentlyModifiedItemIsTapped() -> Bool {
        guard let currentlyModifiedItem = currentlyModifiedItem else { return false }
        let items = items.filter { $0.key == currentlyModifiedItem.keys.first }
        guard let item = items.values.first else { return false }
        if item.isTapped { return true }
        else { return false }
    }
}
