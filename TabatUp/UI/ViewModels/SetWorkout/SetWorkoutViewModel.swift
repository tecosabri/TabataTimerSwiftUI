//
//  SetWorkoutViewModel.swift
//  TabatUp
//
//  Created by Ismael Sabri Pérez on 28/10/22.
//

import SwiftUI
import Combine


final class SetWorkoutViewModel: ObservableObject {
    // MARK: - Properties
    /// The title of the workout.
    @Published var title: String {didSet{ manageSettingTitle(withOldValue: oldValue)}}
    /// The time to prepare before the whole workout starts.
    @Published var prepareTime: String {didSet{currentlyModifiedItem = items[.prepareTime]!}}
    /// The round workout time.
    @Published var workTime: String {didSet{currentlyModifiedItem = items[.workTime]!}}
    /// The rest time between cycles.
    @Published var restBetweenCycles: String {didSet{currentlyModifiedItem = items[.restBetweenCycles]!}}
    /// The number of cycles in each set.
    @Published var cycles: String {didSet{currentlyModifiedItem = items[.cycles]!}}
    /// The number of sets in the workout.
    @Published var sets: String {didSet{currentlyModifiedItem = items[.sets]!}}
    /// The rest time between sets.
    @Published var restBetweenSets: String {didSet{currentlyModifiedItem = items[.restBetweenSets]!}}
    /// A string representing the value of the property that is being modified.
    @Published var currentlyModifiedItem: SetWorkoutItemViewModel?
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
    /// Populates the items of the workout view model with the data stored in a workout model. Function to be called after the initialization of the other properties
    func populateItems() {
        items[.prepareTime] = SetWorkoutItemViewModel(workoutOption: .prepareTime, fromSetWorkoutViewModel: self)
        items[.workTime] = SetWorkoutItemViewModel(workoutOption: .workTime, fromSetWorkoutViewModel: self)
        items[.restBetweenCycles] = SetWorkoutItemViewModel(workoutOption: .restBetweenCycles, fromSetWorkoutViewModel: self)
        items[.cycles] = SetWorkoutItemViewModel(workoutOption: .cycles, fromSetWorkoutViewModel: self)
        items[.sets] = SetWorkoutItemViewModel(workoutOption: .sets, fromSetWorkoutViewModel: self)
        items[.restBetweenSets] = SetWorkoutItemViewModel(workoutOption: .restBetweenSets, fromSetWorkoutViewModel: self)
    }
    
    /// Indicates whether the currently modified item has been tapped once.
    /// - Returns: True if the currently modified item has been tapped once, false otherwise.
    func currentlyModifiedItemIsTapped() -> Bool {
        guard let currentlyModifiedItem,
              currentlyModifiedItem.isTapped else { return false }
        return true
    }
    
    /// Prevents title from being longer than 25 characters and having a trailing new line.
    /// - Parameter oldValue: The old value of the title variable.
    func manageSettingTitle(withOldValue oldValue: String) {
        if title.last == "\n" { return }
        if title.count > 25 { title = oldValue }
    }
    
    
    /// When title edited, if it ends in a new line, hides the alphanumeric and numpad keyboard to clear the screen.
    /// - Parameter newValue: The title new edited value.
    func onTitleEdited(withNewValue newValue: String) {
        guard let lastChar = newValue.last else { return }
        if lastChar == "\n" {
            title.removeLast()
            currentlyModifiedItem?.isTapped = false
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}
